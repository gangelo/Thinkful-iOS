//
//  ToggleBarButtonItem.swift
//  Contacts
//
//  Created by Gene M. Angelo  Jr. on 9/21/16.
//  Copyright © 2016 Mohojo Werks LLC. All rights reserved.
//

import UIKit

internal class ToggleBarButtonItem : UIBarButtonItem {
    private var _titles = (title0: "Edit", title1: "Done")
    private var _toggleState = false
    
    init(titles: (title0: String, title1: String), style: UIBarButtonItemStyle, target: AnyObject?, action: Selector?) {
        self._titles = titles
        super.init()
        
        self.title = titles.title0
        self.style = style
        self.target = target
        self.action = action
        self.possibleTitles = Set<String>([titles.title0, titles.title1])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private override init() {
        super.init()
    }
    
    public var titles : (title0: String, title1: String) {
        get { return _titles }
    }
    
    public func toggle() {
        let index = _toggleState.toggle().toInt()
        title = [_titles.0, _titles.1][index]
    }
}
