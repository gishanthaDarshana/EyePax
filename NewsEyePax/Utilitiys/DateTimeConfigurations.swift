//
//  DateTimeConfigurations.swift
//  NewsEyePax
//
//  Created by Gishantha Darshana on 5/29/22.
//

import Foundation
@objc enum DateFormatType: Int, RawRepresentable {
    case EEEE_MMM_d_yyyy //Sunday, Aug 15, 2021
    case MM_dd_yyyy //08/15/2021
    case MM_dd_yyyy_HH_mm_dash //08-15-2021 06:00
    case yyyy_MM_dd_dash //2021-08-15
    case MMM_d_h_mm_a
    case hh_mm_a //6:00 AM
    case MMMM_yyyy //August 2021
    case MMM_d_yyyy //Aug 15, 2021
    case E_d_MMM_yyyy_HH_mm_ss_Z //Sun, 15 Aug 2021 06:00:09 +0000
    case yyyy_MM_dd_T_HH_mm_ssZ //2021-08-15T06:00:09+0000
    case dd_MM_yy //15.08.21
    case HH_mm_ss_SSS //06:00:09.747
    case dd_MMM_yyyy //17 Dec 2020
    case dd_MMM_yyyy_hh_mm_a //17 Dec 2020 | 12:53PM
    case dd_Suffix_MMMM_yyyy //22nd May, 2021
}

enum DateFormat: String {
    case EEEE_MMM_d_yyyy = "EEEE, MMM d, yyyy" //Sunday, Aug 15, 2021
    case MM_dd_yyyy = "MM/dd/yyyy" //08/15/2021
    case MM_dd_yyyy_HH_mm_dash = "MM-dd-yyyy HH:mm" //08-15-2021 06:00
    case yyyy_MM_dd_dash = "yyyy-MM-dd" //2021-08-15
    case yyyy_dd_MM_dash = "yyyy-dd-MM" //2021-15-08
    case MMM_d_h_mm_a = "MMM d, h:mm a"
    case hh_mm_a = "hh:mm a"//6:00 AM
    case MMMM_yyyy = "MMMM yyyy" //August 2021
    case MMM_d_yyyy = "MMM d, yyyy" //Aug 15, 2021
    case E_d_MMM_yyyy_HH_mm_ss_Z = "E, d MMM yyyy HH:mm:ss Z" //Sun, 15 Aug 2021 06:00:09 +0000
    case yyyy_MM_dd_T_HH_mm_ssZ = "yyyy-MM-dd'T'HH:mm:ssZ" //2021-08-15T06:00:09+0000
    case dd_MM_yy = "dd.MM.yy" //15.08.21
    case HH_mm_ss_SSS = "HH:mm:ss.SSS" //06:00:09.747
    case dd_MMM_yyyy = "dd MMM yyyy" //17 Dec 2020
    case dd_MMM_yyyy_devided = "dd MMM, yyyy"// 17 Dec, 2020
    case dd_MMM_yyyy_hh_mm_a = "dd MMM yyyy | hh:mma" //17 Dec 2020 | 12:53PM
    case dd_Suffix_MMMM_yyyy = "WithSuffix" //22nd May, 2021
}

extension Date
{
    
    var millisecondsSince1970:Int64 {
        Int64((self.timeIntervalSince1970 * 1000.0).rounded())
    }
        
    init(milliseconds:Int64) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
    }
    
    
    func dateFormatWithSuffix() -> String {
        return "dd'\(self.daySuffix())' MMMM, yyyy"
    }

    func daySuffix() -> String {
        let calendar = Calendar.current
        let components = (calendar as NSCalendar).components(.day, from: self)
        let dayOfMonth = components.day
        switch dayOfMonth {
            case 1, 21, 31:
                return "st"
            case 2, 22:
                return "nd"
            case 3, 23:
                return "rd"
            default:
                return "th"
        }
    }
    
    func format(_ format: DateFormat) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = (format == DateFormat.dd_Suffix_MMMM_yyyy) ?
            self.dateFormatWithSuffix() :
            format.rawValue
        return formatter.string(from: self)
    }
    
    
    static func format(_ format: DateFormatType) -> DateFormat
    {
            switch format {
                case .EEEE_MMM_d_yyyy:
                    return .EEEE_MMM_d_yyyy
                case .MM_dd_yyyy:
                    return .MM_dd_yyyy
                case .MM_dd_yyyy_HH_mm_dash:
                    return .MM_dd_yyyy_HH_mm_dash
                case .yyyy_MM_dd_dash:
                    return .yyyy_MM_dd_dash
                case .MMM_d_h_mm_a:
                    return .MMM_d_h_mm_a
                case .hh_mm_a:
                    return .hh_mm_a
                case .MMMM_yyyy:
                    return .MMMM_yyyy
                case .MMM_d_yyyy:
                    return .MMM_d_yyyy
                case .E_d_MMM_yyyy_HH_mm_ss_Z:
                    return .E_d_MMM_yyyy_HH_mm_ss_Z
                case .yyyy_MM_dd_T_HH_mm_ssZ:
                    return .yyyy_MM_dd_T_HH_mm_ssZ
                case .dd_MM_yy:
                    return .dd_MM_yy
                case .HH_mm_ss_SSS:
                    return .HH_mm_ss_SSS
                case .dd_MMM_yyyy:
                    return .dd_MMM_yyyy
                case .dd_MMM_yyyy_hh_mm_a:
                    return .dd_MMM_yyyy_hh_mm_a
                case .dd_Suffix_MMMM_yyyy:
                    return .dd_Suffix_MMMM_yyyy
            }
    }
}


