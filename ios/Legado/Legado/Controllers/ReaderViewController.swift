import UIKit

class ReaderViewController: UIViewController {
    private let book: Book
    private let textView = UITextView()
    private var currentChapter: BookChapter?
    
    init(book: Book) {
        self.book = book
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadChapter()
    }
    
    private func setupUI() {
        title = book.name
        view.backgroundColor = .white
        
        textView.font = UIFont.systemFont(ofSize: 18)
        textView.textAlignment = .left
        textView.isEditable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textView)
        
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            textView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        // 添加手势识别
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    private func loadChapter() {
        let chapters = DatabaseManager.shared.getChapters(by: book.bookUrl)
        if let chapter = chapters.first(where: { $0.index == book.durChapterIndex }) {
            currentChapter = chapter
            loadChapterContent(chapter)
        }
    }
    
    private func loadChapterContent(_ chapter: BookChapter) {
        // 实现加载章节内容的逻辑
        textView.text = "加载中..."
        
        Task {
            do {
                let content = try await NetworkService.shared.request(chapter.url)
                DispatchQueue.main.async {
                    self.textView.text = content
                }
            } catch {
                DispatchQueue.main.async {
                    self.textView.text = "加载失败: \(error.localizedDescription)"
                }
            }
        }
    }
    
    @objc private func handleTap() {
        // 实现点击屏幕显示/隐藏菜单的逻辑
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // 保存阅读进度
        ReadBook.shared.book = book
        ReadBook.shared.saveRead()
    }
}