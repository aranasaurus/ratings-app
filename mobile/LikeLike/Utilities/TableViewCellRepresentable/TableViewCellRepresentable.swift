/*
 MIT License

 Copyright (c) 2017 Ian Keen

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.

 https://github.com/IanKeen/TweetleDumb/tree/master/TweetleDumb/Utilities/TableViewCellRepresentable
 */

import UIKit

protocol TableViewCellRepresentable: TableViewCellViewModel {
    associatedtype TableViewCell: UITableViewCell
}

extension TableViewCellRepresentable {
    static func register(with tableView: UITableView) {
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.reuseIdentifier)
    }
    func dequeue(from tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseIdentifier, for: indexPath)
    }
}

extension UITableView {
    func register(cells: [TableViewCellViewModel.Type]) {
        cells.forEach { $0.register(with: self) }
    }
}
