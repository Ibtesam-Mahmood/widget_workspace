import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tuple/tuple.dart';

class PhoneFeild extends StatelessWidget {

  ///Must be between (0-245)
  final int index; //The index for the country in the list
  final Function openCodeChanger; ///the function that runs when the code segment is tapped

  PhoneFeild({Key key, this.index = 0, @required this.openCodeChanger}):super(key: key);

  //The codes;
  List<Tuple3<String ,String, int>> _codes = [
    Tuple3("Afghanistan", "AF", 93),
    Tuple3("Åland Islands", "AX", 358),
    Tuple3("Albania", "AL", 355),
    Tuple3("Algeria", "DZ", 213),
    Tuple3("American Samoa", "AS", 1684),
    Tuple3("Andorra", "AD", 376),
    Tuple3("Angola", "AO", 244),
    Tuple3("Anguilla", "AI", 1264),
    Tuple3("Antarctica", "AQ", 672),
    Tuple3("Antigua and Barbuda", "AG", 1268),
    Tuple3("Argentina", "AR", 54),
    Tuple3("Armenia", "AM", 374),
    Tuple3("Aruba", "AW", 297),
    Tuple3("Australia", "AU", 61),
    Tuple3("Austria", "AT", 43),
    Tuple3("Azerbaijan", "AZ", 994),
    Tuple3("Bahamas", "BS", 1242),
    Tuple3("Bahrain", "BH", 973),
    Tuple3("Bangladesh", "BD", 880),
    Tuple3("Barbados", "BB", 1246),
    Tuple3("Belarus", "BY", 375),
    Tuple3("Belgium", "BE", 32),
    Tuple3("Belize", "BZ", 501),
    Tuple3("Benin", "BJ", 229),
    Tuple3("Bermuda", "BM", 1441),
    Tuple3("Bhutan", "BT", 975),
    Tuple3("Bolivia (Plurinational State of)", "BO", 591),
    Tuple3("Bonaire, Sint Eustatius and Saba", "BQ", 5997),
    Tuple3("Bosnia and Herzegovina", "BA", 387),
    Tuple3("Botswana", "BW", 267),
    Tuple3("Brazil", "BR", 55),
    Tuple3("British Indian Ocean Territory", "IO", 246),
    Tuple3("Virgin Islands (British)", "VG", 1284),
    Tuple3("Virgin Islands (U.S.)", "VI", 1340),
    Tuple3("Brunei Darussalam", "BN", 673),
    Tuple3("Bulgaria", "BG", 359),
    Tuple3("Burkina Faso", "BF", 226),
    Tuple3("Burundi", "BI", 257),
    Tuple3("Cambodia", "KH", 855),
    Tuple3("Cameroon", "CM", 237),
    Tuple3("Canada", "CA", 1),
    Tuple3("Cabo Verde", "CV", 238),
    Tuple3("Cayman Islands", "KY", 1345),
    Tuple3("Central African Republic", "CF", 236),
    Tuple3("Chad", "TD", 235),
    Tuple3("Chile", "CL", 56),
    Tuple3("China", "CN", 86),
    Tuple3("Christmas Island", "CX", 61),
    Tuple3("Cocos (Keeling) Islands", "CC", 61),
    Tuple3("Colombia", "CO", 57),
    Tuple3("Comoros", "KM", 269),
    Tuple3("Congo", "CG", 242),
    Tuple3("Congo (Democratic Republic of the)", "CD", 243),
    Tuple3("Cook Islands", "CK", 682),
    Tuple3("Costa Rica", "CR", 506),
    Tuple3("Croatia", "HR", 385),
    Tuple3("Cuba", "CU", 53),
    Tuple3("Curaçao", "CW", 599),
    Tuple3("Cyprus", "CY", 357),
    Tuple3("Czech Republic", "CZ", 420),
    Tuple3("Denmark", "DK", 45),
    Tuple3("Djibouti", "DJ", 253),
    Tuple3("Dominica", "DM", 1767),
    Tuple3("Dominican Republic", "DO", 1809),
    Tuple3("Ecuador", "EC", 593),
    Tuple3("Egypt", "EG", 20),
    Tuple3("El Salvador", "SV", 503),
    Tuple3("Equatorial Guinea", "GQ", 240),
    Tuple3("Eritrea", "ER", 291),
    Tuple3("Estonia", "EE", 372),
    Tuple3("Ethiopia", "ET", 251),
    Tuple3("Falkland Islands (Malvinas)", "FK", 500),
    Tuple3("Faroe Islands", "FO", 298),
    Tuple3("Fiji", "FJ", 679),
    Tuple3("Finland", "FI", 358),
    Tuple3("France", "FR", 33),
    Tuple3("French Guiana", "GF", 594),
    Tuple3("French Polynesia", "PF", 689),
    Tuple3("Gabon", "GA", 241),
    Tuple3("Gambia", "GM", 220),
    Tuple3("Georgia", "GE", 995),
    Tuple3("Germany", "DE", 49),
    Tuple3("Ghana", "GH", 233),
    Tuple3("Gibraltar", "GI", 350),
    Tuple3("Greece", "GR", 30),
    Tuple3("Greenland", "GL", 299),
    Tuple3("Grenada", "GD", 1473),
    Tuple3("Guadeloupe", "GP", 590),
    Tuple3("Guam", "GU", 1671),
    Tuple3("Guatemala", "GT", 502),
    Tuple3("Guernsey", "GG", 44),
    Tuple3("Guinea", "GN", 224),
    Tuple3("Guinea-Bissau", "GW", 245),
    Tuple3("Guyana", "GY", 592),
    Tuple3("Haiti", "HT", 509),
    Tuple3("Holy See", "VA", 379),
    Tuple3("Honduras", "HN", 504),
    Tuple3("Hong Kong", "HK", 852),
    Tuple3("Hungary", "HU", 36),
    Tuple3("Iceland", "IS", 354),
    Tuple3("India", "IN", 91),
    Tuple3("Indonesia", "ID", 62),
    Tuple3("Côte d'Ivoire", "CI", 225),
    Tuple3("Iran (Islamic Republic of)", "IR", 98),
    Tuple3("Iraq", "IQ", 964),
    Tuple3("Ireland", "IE", 353),
    Tuple3("Isle of Man", "IM", 44),
    Tuple3("Israel", "IL", 972),
    Tuple3("Italy", "IT", 39),
    Tuple3("Jamaica", "JM", 1876),
    Tuple3("Japan", "JP", 81),
    Tuple3("Jersey", "JE", 44),
    Tuple3("Jordan", "JO", 962),
    Tuple3("Kazakhstan", "KZ", 76),
    Tuple3("Kenya", "KE", 254),
    Tuple3("Kiribati", "KI", 686),
    Tuple3("Kuwait", "KW", 965),
    Tuple3("Kyrgyzstan", "KG", 996),
    Tuple3("Lao People's Democratic Republic", "LA", 856),
    Tuple3("Latvia", "LV", 371),
    Tuple3("Lebanon", "LB", 961),
    Tuple3("Lesotho", "LS", 266),
    Tuple3("Liberia", "LR", 231),
    Tuple3("Libya", "LY", 218),
    Tuple3("Liechtenstein", "LI", 423),
    Tuple3("Lithuania", "LT", 370),
    Tuple3("Luxembourg", "LU", 352),
    Tuple3("Macao", "MO", 853),
    Tuple3("Macedonia (the former Yugoslav Republic of)", "MK", 389),
    Tuple3("Madagascar", "MG", 261),
    Tuple3("Malawi", "MW", 265),
    Tuple3("Malaysia", "MY", 60),
    Tuple3("Maldives", "MV", 960),
    Tuple3("Mali", "ML", 223),
    Tuple3("Malta", "MT", 356),
    Tuple3("Marshall Islands", "MH", 692),
    Tuple3("Martinique", "MQ", 596),
    Tuple3("Mauritania", "MR", 222),
    Tuple3("Mauritius", "MU", 230),
    Tuple3("Mayotte", "YT", 262),
    Tuple3("Mexico", "MX", 52),
    Tuple3("Micronesia (Federated States of)", "FM", 691),
    Tuple3("Moldova (Republic of)", "MD", 373),
    Tuple3("Monaco", "MC", 377),
    Tuple3("Mongolia", "MN", 976),
    Tuple3("Montenegro", "ME", 382),
    Tuple3("Montserrat", "MS", 1664),
    Tuple3("Morocco", "MA", 212),
    Tuple3("Mozambique", "MZ", 258),
    Tuple3("Myanmar", "MM", 95),
    Tuple3("Namibia", "NA", 264),
    Tuple3("Nauru", "NR", 674),
    Tuple3("Nepal", "NP", 977),
    Tuple3("Netherlands", "NL", 31),
    Tuple3("New Caledonia", "NC", 687),
    Tuple3("New Zealand", "NZ", 64),
    Tuple3("Nicaragua", "NI", 505),
    Tuple3("Niger", "NE", 227),
    Tuple3("Nigeria", "NG", 234),
    Tuple3("Niue", "NU", 683),
    Tuple3("Norfolk Island", "NF", 672),
    Tuple3("Korea (Democratic People's Republic of)", "KP", 850),
    Tuple3("Northern Mariana Islands", "MP", 1670),
    Tuple3("Norway", "NO", 47),
    Tuple3("Oman", "OM", 968),
    Tuple3("Pakistan", "PK", 92),
    Tuple3("Palau", "PW", 680),
    Tuple3("Palestine, State of", "PS", 970),
    Tuple3("Panama", "PA", 507),
    Tuple3("Papua New Guinea", "PG", 675),
    Tuple3("Paraguay", "PY", 595),
    Tuple3("Peru", "PE", 51),
    Tuple3("Philippines", "PH", 63),
    Tuple3("Pitcairn", "PN", 64),
    Tuple3("Poland", "PL", 48),
    Tuple3("Portugal", "PT", 351),
    Tuple3("Puerto Rico", "PR", 1787),
    Tuple3("Qatar", "QA", 974),
    Tuple3("Republic of Kosovo", "XK", 383),
    Tuple3("Réunion", "RE", 262),
    Tuple3("Romania", "RO", 40),
    Tuple3("Russian Federation", "RU", 7),
    Tuple3("Rwanda", "RW", 250),
    Tuple3("Saint Barthélemy", "BL", 590),
    Tuple3("Saint Helena, Ascension and Tristan da Cunha", "SH", 290),
    Tuple3("Saint Kitts and Nevis", "KN", 1869),
    Tuple3("Saint Lucia", "LC", 1758),
    Tuple3("Saint Martin (French part)", "MF", 590),
    Tuple3("Saint Pierre and Miquelon", "PM", 508),
    Tuple3("Saint Vincent and the Grenadines", "VC", 1784),
    Tuple3("Samoa", "WS", 685),
    Tuple3("San Marino", "SM", 378),
    Tuple3("Sao Tome and Principe", "ST", 239),
    Tuple3("Saudi Arabia", "SA", 966),
    Tuple3("Senegal", "SN", 221),
    Tuple3("Serbia", "RS", 381),
    Tuple3("Seychelles", "SC", 248),
    Tuple3("Sierra Leone", "SL", 232),
    Tuple3("Singapore", "SG", 65),
    Tuple3("Sint Maarten (Dutch part)", "SX", 1721),
    Tuple3("Slovakia", "SK", 421),
    Tuple3("Slovenia", "SI", 386),
    Tuple3("Solomon Islands", "SB", 677),
    Tuple3("Somalia", "SO", 252),
    Tuple3("South Africa", "ZA", 27),
    Tuple3("South Georgia and the South Sandwich Islands", "GS", 500),
    Tuple3("Korea (Republic of)", "KR", 82),
    Tuple3("South Sudan", "SS", 211),
    Tuple3("Spain", "ES", 34),
    Tuple3("Sri Lanka", "LK", 94),
    Tuple3("Sudan", "SD", 249),
    Tuple3("Suriname", "SR", 597),
    Tuple3("Svalbard and Jan Mayen", "SJ", 4779),
    Tuple3("Swaziland", "SZ", 268),
    Tuple3("Sweden", "SE", 46),
    Tuple3("Switzerland", "CH", 41),
    Tuple3("Syrian Arab Republic", "SY", 963),
    Tuple3("Taiwan", "TW", 886),
    Tuple3("Tajikistan", "TJ", 992),
    Tuple3("Tanzania, United Republic of", "TZ", 255),
    Tuple3("Thailand", "TH", 66),
    Tuple3("Timor-Leste", "TL", 670),
    Tuple3("Togo", "TG", 228),
    Tuple3("Tokelau", "TK", 690),
    Tuple3("Tonga", "TO", 676),
    Tuple3("Trinidad and Tobago", "TT", 1868),
    Tuple3("Tunisia", "TN", 216),
    Tuple3("Turkey", "TR", 90),
    Tuple3("Turkmenistan", "TM", 993),
    Tuple3("Turks and Caicos Islands", "TC", 1649),
    Tuple3("Tuvalu", "TV", 688),
    Tuple3("Uganda", "UG", 256),
    Tuple3("Ukraine", "UA", 380),
    Tuple3("United Arab Emirates", "AE", 971),
    Tuple3("United Kingdom of Great Britain and Northern Ireland", "GB", 44),
    Tuple3("United States of America", "US", 1),
    Tuple3("Uruguay", "UY", 598),
    Tuple3("Uzbekistan", "UZ", 998),
    Tuple3("Vanuatu", "VU", 678),
    Tuple3("Venezuela (Bolivarian Republic of)", "VE", 58),
    Tuple3("Viet Nam", "VN", 84),
    Tuple3("Wallis and Futuna", "WF", 681),
    Tuple3("Western Sahara", "EH", 212),
    Tuple3("Yemen", "YE", 967),
    Tuple3("Zambia", "ZM", 260),
    Tuple3("Zimbabwe", "ZW", 263),
  ];



  @override
  Widget build(BuildContext context) {
    String iso = _codes[index].item2;
    int code = _codes[index].item3;

    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1, color: Color(0xFF718093)))
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

          //International number section
          GestureDetector(
            onTap: (){
              openCodeChanger();
            },
            child: Container(
              child: Align(alignment: Alignment.center, child: Text(iso + ' +' + code.toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
            child: Container(
              height: double.infinity,
              width: 1,
              color: Color(0xFF718093)
            ),
          ),

            //Text feild section
            Expanded(
              flex: 1,
              child: TextField(
                
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  LengthLimitingTextInputFormatter(14),
                  WhitelistingTextInputFormatter.digitsOnly,
                  NumberTextInputFormatter()
                ],
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Phone',
                  hintStyle: TextStyle(color: Color(0xFF718093), fontSize: 16)
                  
                ),
                cursorColor: Color(0xFF273C75),
                cursorRadius: Radius.circular(20),
                
              ),
            )
            
          ],
        ),
      ),
    );
  }
}


class NumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue
  ) {
    final int newTextLength = newValue.text.length;
    int selectionIndex = newValue.selection.end;
    int usedSubstringIndex = 0;
    final StringBuffer newText = StringBuffer();
    if (newTextLength >= 1) {
      newText.write('(');
      if (newValue.selection.end >= 1)
        selectionIndex++;
    }
    if (newTextLength >= 4) {
      newText.write(newValue.text.substring(0, usedSubstringIndex = 3) + ') ');
      if (newValue.selection.end >= 3)
        selectionIndex += 2;
    }
    if (newTextLength >= 7) {
      newText.write(newValue.text.substring(3, usedSubstringIndex = 6) + ' ');
      if (newValue.selection.end >= 6)
        selectionIndex++;
    }
    if (newTextLength >= 11) {
      newText.write(newValue.text.substring(6, usedSubstringIndex = 10) + ' ');
      if (newValue.selection.end >= 10)
        selectionIndex++;
    }
    // Dump the rest.
    if (newTextLength >= usedSubstringIndex)
      newText.write(newValue.text.substring(usedSubstringIndex));
    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}