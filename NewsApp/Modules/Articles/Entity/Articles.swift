//
//  Articles.swift
//  NewsApp
//
//  Created Mena Gamal on 12/15/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation
class Articles : NSObject,Codable, NSCoding {
    
	let source : Source?
	let author : String?
	let title : String?
	let desc : String?
	let url : String?
	let urlToImage : String?
	let publishedAt : String?
	let content : String?

    var publishedAtDate = Date ()
	enum CodingKeys: String, CodingKey {

		case source = "source"
		case author = "author"
		case title = "title"
		case desc = "description"
		case url = "url"
		case urlToImage = "urlToImage"
		case publishedAt = "publishedAt"
		case content = "content"
	}

    required init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		source = try values.decodeIfPresent(Source.self, forKey: .source)
		author = try values.decodeIfPresent(String.self, forKey: .author)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		desc = try values.decodeIfPresent(String.self, forKey: .desc)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		urlToImage = try values.decodeIfPresent(String.self, forKey: .urlToImage)
		publishedAt = try values.decodeIfPresent(String.self, forKey: .publishedAt)
		content = try values.decodeIfPresent(String.self, forKey: .content)
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"
        if let publishedAt = publishedAt, let date = dateFormatterGet.date(from: publishedAt) {
            publishedAtDate = date
        }
        
	}
    
    func encode(with coder: NSCoder) {
        coder.encode(self.source, forKey: CodingKeys.source.rawValue)
        coder.encode(self.author, forKey: CodingKeys.author.rawValue)
        coder.encode(self.title, forKey: CodingKeys.title.rawValue)
        coder.encode(self.desc, forKey: CodingKeys.desc.rawValue)
        coder.encode(self.url, forKey: CodingKeys.url.rawValue)
        coder.encode(self.urlToImage, forKey: CodingKeys.urlToImage.rawValue)
        coder.encode(self.publishedAt, forKey: CodingKeys.publishedAt.rawValue)
        coder.encode(self.content, forKey: CodingKeys.content.rawValue)
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"
        if let publishedAt = publishedAt, let date = dateFormatterGet.date(from: publishedAt) {
            publishedAtDate = date
        }
        
    }
    
    required init?(coder: NSCoder) {
        self.source = coder.decodeObject(forKey: CodingKeys.source.rawValue) as? Source
        self.author = coder.decodeObject(forKey: CodingKeys.author.rawValue) as? String
        self.title = coder.decodeObject(forKey: CodingKeys.title.rawValue) as? String
        self.desc = coder.decodeObject(forKey: CodingKeys.desc.rawValue) as? String
        self.url = coder.decodeObject(forKey: CodingKeys.url.rawValue) as? String
        self.urlToImage = coder.decodeObject(forKey: CodingKeys.urlToImage.rawValue) as? String
        self.publishedAt = coder.decodeObject(forKey: CodingKeys.publishedAt.rawValue) as? String
        self.content = coder.decodeObject(forKey: CodingKeys.content.rawValue) as? String
        
    }

}
