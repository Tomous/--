# --
很简单好用的二级列表
最近发现一个问题，就是如果列表数据多了的话，点击最下面的二级列表，tableview就会自动回滚到最上面去，一直以为是刷新了整个tableview导致的，后来发现并不是，给tableview添加这三个属性就好了
```
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
```
![gif](https://github.com/Tomous/--/blob/master/gif.gif)
