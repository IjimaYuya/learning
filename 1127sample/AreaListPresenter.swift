//
//  AreaListPresenter.swift
//  koronaDataFromAPI
//

import Foundation
import Alamofire

class AreaListPresenter: NSObject {

    //MARK: - Proprety
    
    /// デコーダー
    let decode = JSONDecoder()
    /// APIレスポンスデータのデコード用配列
    var covid19Array = [Covid19ReportStruct]()
    /// APIレスポンス
    var responseData: ResponseData
    
    //MARK: - Init
    ///セット
    override init() {
        /// エリア一覧の配列に挿入
        covid19Array.append(Covid19ReportStruct(areaName: "北海道", areaID: 0, todofukenID: 1, responseData: responseData))
        covid19Array.append(Covid19ReportStruct(areaName: "東北", areaID: 1, todofukenID: 2, responseData: responseData))
        covid19Array.append(Covid19ReportStruct(areaName: "東北", areaID: 2, todofukenID: 3, responseData: responseData))
        covid19Array.append(Covid19ReportStruct(areaName: "東北", areaID: 0, todofukenID: 4, responseData: responseData))
        covid19Array.append(Covid19ReportStruct(areaName: "東北", areaID: 0, todofukenID: 5, responseData: responseData))
        covid19Array.append(Covid19ReportStruct(areaName: "東北", areaID: 0, todofukenID: 6, responseData: responseData))
        covid19Array.append(Covid19ReportStruct(areaName: "東北", areaID: 0, todofukenID: 7, responseData: responseData))
        covid19Array.append(Covid19ReportStruct(areaName: "東北", areaID: 0, todofukenID: 8, responseData: responseData))
    }
    
    //MARK: - Method
    
    /// APIレスポンスのJsonデータと、covid19Arrayの配列をループ回し、同じidを見つけたらcovid19Arrayの各要素に入れる
    func  SetAPIResponseData() {

        }
    }
    
    ///covid19のAPIに通信
    func communicationAPI(sucsess: @escaping () -> () ) {
        var responseDataDecode: ResponseData
        AF.request("https://covid19-japan-web-api.now.sh/api/v1/prefectures").responseJSON { response in
            guard let data = response.data else{
                return
            }
            do{
                responseDataDecode = try JSONDecoder().decode(ResponseData.self, from: data)
            } catch let error {
                    print("Error: \(error)")
                }
        }
    }
    
    /// tableviewのrowの数
    func getTodofukensuu(areaNum: Int) -> Int {
//        return areaSectionArray[areaNum].todofukensuu
    }
    
    /// tableviewのcellの情報
    func getResponse(areaNum: Int, row: Int) -> Covid19ReportStruct {
        if covid19Array.count != 0{
            switch areaNum {
            case 0:
                return covid19Array[row + 0]
            case 1:
                return covid19Array[row + 1]
            case 2:
                return covid19Array[row + 7]
            case 3:
                return covid19Array[row + 14]
            case 4:
                return covid19Array[row + 23]
            case 5:
                return covid19Array[row + 30]
            case 6:
                return covid19Array[row + 35]
            case 7:
                return covid19Array[row + 39]
            default:
                return Covid19ReportStruct(id: 0, name_ja: "", population: 0, cases: 0, deaths: 0, pcr: 0, severe: 0)
            }
        }else{
            return Covid19ReportStruct(id: 0, name_ja: "", population: 0, cases: 0, deaths: 0, pcr: 0, severe: 0)
        }
    }
    
    /// エリア名の取得
    func getAreaName(areaNum: Int) -> String {
        return areaSectionArray[areaNum].areaName
    }
    
    ///　エリア数の取得
    func getAreaNum() -> Int {
        return areaSectionArray.count
    }
    
    /// AreaSectionArrayのisShownのtoggle
    func setAreaSectionArrayIsshownToggle(areaNum: Int){
        return areaSectionArray[areaNum].isShown.toggle()
    }
}
