//
//  MarketData.swift
//  CryptoCurrencySwiftUI
//
//  Created by Alexander Korchak on 01.06.2023.
//

import Foundation


// Json data
/*
URL: https://api.coingecko.com/api/v3/global
 
 JSON Response:
 
 {
 "data": {
 "active_cryptocurrencies": 10150,
 "upcoming_icos": 0,
 "ongoing_icos": 49,
 "ended_icos": 3376,
 "markets": 748,
 "total_market_cap": {
 "btc": 43796384.63692273,
 "eth": 632644552.4332086,
 "ltc": 12735085406.780365,
 "bch": 10419770639.174267,
 "bnb": 3861663682.1789584,
 "eos": 1327814637558.7576,
 "xrp": 2327216032092.9917,
 "xlm": 12701664860291.088,
 "link": 183799948940.477,
 "dot": 225223063617.69016,
 "yfi": 183353494.90973604,
 "usd": 1176549351579.343,
 "aed": 4321436354617.1333,
 "ars": 281620959993920.2,
 "aud": 1803951352605.135,
 "bdt": 126165751967947.36,
 "bhd": 443593225476.606,
 "bmd": 1176549351579.343,
 "brl": 5948398211714.838,
 "cad": 1595808006817.2358,
 "chf": 1068006791149.3895,
 "clp": 953157926194973.8,
 "cny": 8365148234793.976,
 "czk": 26023243285852.945,
 "dkk": 8179473451973.171,
 "eur": 1098257051527.8456,
 "gbp": 942879591059.5757,
 "hkd": 9215540457875.242,
 "huf": 406874846211715.4,
 "idr": 17562980108355824,
 "ils": 4383382854527.137,
 "inr": 96981774735840.2,
 "jpy": 164120986974532.88,
 "krw": 1553896130465233.5,
 "kwd": 361907757095.1573,
 "lkr": 346955806734635.94,
 "mmk": 2469721540988228.5,
 "mxn": 20737976525872.645,
 "myr": 5428010433511.312,
 "ngn": 542305927852998.3,
 "nok": 13133607456247.576,
 "nzd": 1954552022705.9956,
 "php": 66070299504542.65,
 "pkr": 335534828046873.3,
 "pln": 4988585722387.346,
 "rub": 95265203350478.06,
 "sar": 4412609516969.7295,
 "sek": 12781810964279.871,
 "sgd": 1589926436608.6907,
 "thb": 40881952110261.49,
 "try": 24480228224990.414,
 "twd": 36161006657822.07,
 "uah": 43436574892556.08,
 "vef": 117807886573.63957,
 "vnd": 27634747335196390,
 "zar": 23265028050662.32,
 "xdr": 883203831398.1176,
 "xag": 50018042543.52316,
 "xau": 597934145.9661355,
 "bits": 43796384636922.734,
 "sats": 4379638463692273
 },
 "total_volume": {
 "btc": 1326890.3473625819,
 "eth": 19167106.07266526,
 "ltc": 385832347.5597792,
 "bch": 315685716.92551064,
 "bnb": 116996055.8873184,
 "eos": 40228535763.15779,
 "xrp": 70507200875.39647,
 "xlm": 384819811915.39136,
 "link": 5568550466.360828,
 "dot": 6823538326.170377,
 "yfi": 5555024.337461324,
 "usd": 35645681504.27191,
 "aed": 130925697023.15297,
 "ars": 8532214166278.098,
 "aud": 54653955040.51386,
 "bdt": 3822418673181.4585,
 "bhd": 13439455651.87407,
 "bmd": 35645681504.27191,
 "brl": 180217436549.29776,
 "cad": 48347877525.59319,
 "chf": 32357189157.095264,
 "clp": 28877635957055.82,
 "cny": 253437230927.223,
 "czk": 788421021719.5812,
 "dkk": 247811878991.9889,
 "eur": 33273675274.25159,
 "gbp": 28566235283.43447,
 "hkd": 279201394833.2879,
 "huf": 12327006224340.566,
 "idr": 532102112306587.75,
 "ils": 132802477800.0344,
 "inr": 2938237524258.8154,
 "jpy": 4972340872916.147,
 "krw": 47078081750614.05,
 "kwd": 10964647276.395536,
 "lkr": 10511651012615.023,
 "mmk": 74824661911659.05,
 "mxn": 628294346762.4467,
 "myr": 164451351619.95883,
 "ngn": 16430134746305.219,
 "nok": 397906290763.8352,
 "nzd": 59216673564.42372,
 "php": 2001718712325.4802,
 "pkr": 10165631894739.025,
 "pln": 151138188617.65424,
 "rub": 2886230902692.258,
 "sar": 133687952174.28233,
 "sek": 387247982474.28674,
 "sgd": 48169684763.753334,
 "thb": 1238592365240.8765,
 "try": 741672601568.7659,
 "twd": 1095562820606.1327,
 "uah": 1315989263160.1975,
 "vef": 3569202089.0227447,
 "vnd": 837244439121182,
 "zar": 704855923781.3966,
 "xdr": 26758250671.856228,
 "xag": 1515386678.49354,
 "xau": 18115491.79728595,
 "bits": 1326890347362.5818,
 "sats": 132689034736258.19
 },
 "market_cap_percentage": {
 "btc": 44.272661227048694,
 "eth": 19.004495558887683,
 "usdt": 7.0753695807982835,
 "bnb": 4.088080408672662,
 "usdc": 2.4527847258509214,
 "xrp": 2.234386213591616,
 "steth": 1.0993026962692845,
 "ada": 1.0833416517308478,
 "doge": 0.8524453764413477,
 "matic": 0.7059717901650995
 },
 "market_cap_change_percentage_24h_usd": -0.5184804032137502,
 "updated_at": 1685619524
 }
 }
 
 */


struct GlobalData: Codable {
    let data: MarketData?
}

struct MarketData: Codable {
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double
    
    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
    
    var marketCap: String {
        if let item = totalMarketCap.first(where: { $0.key == "usd" }) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var volume: String {
        if let item = totalVolume.first(where: { $0.key == "usd" }) {
            return  "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var btcDominance: String {
        if let item = marketCapPercentage.first(where: { $0.key == "btc" }) {
            return "\(item.value.asPercentString())"
        }
        return ""
    }
}
