//
//  Data.swift
//  CodeBaseUI
//
//  Created by 유철원 on 6/5/24.
//

import Foundation

struct Lotto: Decodable {
    
    let returnValue: String
    let drwNo: Int
    let drwNoDate: String
    let drwtNo1: Int
    let drwtNo2: Int
    let drwtNo3: Int
    let drwtNo4: Int
    let drwtNo5: Int
    let drwtNo6: Int
    let bnusNo: Int
}


// MARK: - Welcome
struct BoxOfficeResponse: Codable {
    let boxOfficeResult: BoxOfficeResult
}

// MARK: - BoxOfficeResult
struct BoxOfficeResult: Codable {
    let boxofficeType, showRange: String
    let dailyBoxOfficeList: [DailyBoxOfficeList]
}

// MARK: - DailyBoxOfficeList
struct DailyBoxOfficeList: Codable {
    let rnum, rank, rankInten: String
    let rankOldAndNew: RankOldAndNew
    let movieCD, movieNm, openDt, salesAmt: String
    let salesShare, salesInten, salesChange, salesAcc: String
    let audiCnt, audiInten, audiChange, audiAcc: String
    let scrnCnt, showCnt: String

    enum CodingKeys: String, CodingKey {
        case rnum, rank, rankInten, rankOldAndNew
        case movieCD = "movieCd"
        case movieNm, openDt, salesAmt, salesShare, salesInten, salesChange, salesAcc, audiCnt, audiInten, audiChange, audiAcc, scrnCnt, showCnt
    }
}

enum RankOldAndNew: String, Codable {
    case old = "OLD"
}

//
//
//{"boxOfficeResult":
//    {"boxofficeType":"일별 박스오피스",
//        "showRange":"20240604~20240604",
//    "dailyBoxOfficeList":[
//        {"rnum":"1",
//         "rank":"1",
//         "rankInten":"0",
//         "rankOldAndNew":"OLD",
//         "movieCd":"20236653",
//         "movieNm":"퓨리오사: 매드맥스 사가",
//         "openDt":"2024-05-22",
//         "salesAmt":"264355728",
//         "salesShare":"27.7",
//         "salesInten":"-21557718",
//         "salesChange":"-7.5",
//         "salesAcc":"11463580547",
//         "audiCnt":"26374",
//         "audiInten":"-2004",
//         "audiChange":"-7.1",
//         "audiAcc":"1105780",
//         "scrnCnt":"1263",
//         "showCnt":"3588"},
//         {"rnum":"2","rank":"2","rankInten":"0","rankOldAndNew":"OLD","movieCd":"20234045","movieNm":"설계자","openDt":"2024-05-29","salesAmt":"190532469","salesShare":"20.0","salesInten":"26524928","salesChange":"16.2","salesAcc":"3660407722","audiCnt":"21533","audiInten":"3511","audiChange":"19.5","audiAcc":"411668","scrnCnt":"996","showCnt":"3663"},{"rnum":"3","rank":"3","rankInten":"0","rankOldAndNew":"OLD","movieCd":"20203557","movieNm":"그녀가 죽었다","openDt":"2024-05-15","salesAmt":"148278053","salesShare":"15.5","salesInten":"-6808531","salesChange":"-4.4","salesAcc":"9412721272","audiCnt":"15897","audiInten":"-704","audiChange":"-4.2","audiAcc":"985476","scrnCnt":"797","showCnt":"2195"},{"rnum":"4","rank":"4","rankInten":"0","rankOldAndNew":"OLD","movieCd":"20228797","movieNm":"범죄도시4","openDt":"2024-04-24","salesAmt":"132827485","salesShare":"13.9","salesInten":"-13571480","salesChange":"-9.3","salesAcc":"108104121193","audiCnt":"14119","audiInten":"-1296","audiChange":"-8.4","audiAcc":"11302947","scrnCnt":"791","showCnt":"2094"},{"rnum":"5","rank":"5","rankInten":"1","rankOldAndNew":"OLD","movieCd":"20249507","movieNm":"극장판 하이큐!! 쓰레기장의 결전","openDt":"2024-05-15","salesAmt":"32832707","salesShare":"3.4","salesInten":"-745905","salesChange":"-2.2","salesAcc":"5921940092","audiCnt":"3293","audiInten":"23","audiChange":"0.7","audiAcc":"573565","scrnCnt":"424","showCnt":"565"},{"rnum":"6","rank":"6","rankInten":"-1","rankOldAndNew":"OLD","movieCd":"20191143","movieNm":"원더랜드","openDt":"2024-06-05","salesAmt":"22192000","salesShare":"2.3","salesInten":"-15874000","salesChange":"-41.7","salesAcc":"101253000","audiCnt":"2699","audiInten":"-2033","audiChange":"-43","audiAcc":"11902","scrnCnt":"13","showCnt":"13"},{"rnum":"7","rank":"7","rankInten":"3","rankOldAndNew":"OLD","movieCd":"20248879","movieNm":"드림 시나리오","openDt":"2024-05-29","salesAmt":"16354234","salesShare":"1.7","salesInten":"8094156","salesChange":"98","salesAcc":"201361528","audiCnt":"2299","audiInten":"1365","audiChange":"146.1","audiAcc":"24284","scrnCnt":"298","showCnt":"464"},{"rnum":"8","rank":"8","rankInten":"5","rankOldAndNew":"OLD","movieCd":"20249534","movieNm":"분노의 강","openDt":"2024-05-29","salesAmt":"16298600","salesShare":"1.7","salesInten":"12716900","salesChange":"355.1","salesAcc":"98993917","audiCnt":"1929","audiInten":"1492","audiChange":"341.4","audiAcc":"11608","scrnCnt":"78","showCnt":"91"},{"rnum":"9","rank":"9","rankInten":"0","rankOldAndNew":"OLD","movieCd":"20249416","movieNm":"청춘 18X2 너에게로 이어지는 길","openDt":"2024-05-22","salesAmt":"12441889","salesShare":"1.3","salesInten":"1495111","salesChange":"13.7","salesAcc":"1013728454","audiCnt":"1331","audiInten":"166","audiChange":"14.2","audiAcc":"104589","scrnCnt":"247","showCnt":"298"},{"rnum":"10","rank":"10","rankInten":"-2","rankOldAndNew":"OLD","movieCd":"20247783","movieNm":"혹성탈출: 새로운 시대","openDt":"2024-05-08","salesAmt":"12347134","salesShare":"1.3","salesInten":"978595","salesChange":"8.6","salesAcc":"9116743631","audiCnt":"1330","audiInten":"150","audiChange":"12.7","audiAcc":"901098","scrnCnt":"211","showCnt":"261"}]}}
