import 'package:ar_book/styles/colors.dart';
import 'package:ar_book/styles/images/images.dart';
import 'package:ar_book/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: _buildTextHtml(
            '<div><span>Vanmieu.gov.vn</span> xin cam đoan sẽ bảo vệ tuyệt đối những thông tin cá nhân của người sử dụng website. Chúng tôi chỉ thu thập những thông tin cần thiết và có liên quan đến việc sử dụng dịch vụ. Chúng tôi sẽ lưu giữ thông tin của người sử dụng trong thời gian luật pháp quy định hoặc cho mục đích nào đó. Ngoài ra, người sử dụng, thành viên hoặc khách hàng của <span>vanmieu.gov.vn</span> có thể truy cập vào website và trình duyệt mà không cần phải cung cấp bất cứ chi tiết cá nhân nào. Vào lúc đó, bạn đang được ẩn danh và chúng tôi không thể biết bạn là ai cho đến khi bạn đăng nhập vào tài khoản cá nhân của mình.</div><div><strong>1. Mục đích và phạm vi thu thập</strong></div><div>Chúng tôi thu thập, lưu trữ và xử lý thông tin của bạn cho quá trình thực hiện giao dịch, cho những thông báo sau này, hoặc để cung cấp dịch vụ. Chúng tôi không giới hạn các loại thông tin cá nhân thu thập: danh hiệu, tên, giới tính, ngày sinh, email, địa chỉ, số điện thoại, fax, chi tiết thanh toán, chi tiết thanh toán bằng thẻ hoặc chi tiết tài khoản ngân hàng.</div><div>Chúng tôi sẽ dùng thông tin quý khách đã cung cấp để xử lý đơn đặt hàng, cung cấp các dịch vụ và thông tin yêu cầu thông qua website và theo yêu cầu của bạn. Hơn nữa, chúng tôi sẽ sử dụng các thông tin đó để quản lý tài khoản của bạn; xác minh và thực hiện giao dịch trực tuyến, kiểm toán việc tải dữ liệu từ web; cải thiện bố cục và nội dung trang web và điều chỉnh cho phù hợp với người dùng; nhận diện khách vào web, gửi thông tin bao gồm thông tin chỗ ở và dịch vụ, nếu bạn không có dấu hiệu từ chối. Nếu quý khách không muốn nhận bất cứ thông tin tiếp thị của chúng tôi thì có thể từ chối bất cứ lúc nào.</div><div><strong>2. Phạm vi sử dụng thông tin</strong></div><div>Thông tin của khách hàng chỉ được sử dụng trong hoạt động quản lý và vận hành của website, cũng như cung cấp cho các bên liên kết với công ty. Chúng tôi cũng có thể dùng những thông tin chúng tôi tập hợp được để thông báo đến khách hàng những sản phẩm hoặc dịch vụ khác đang có trên vanmieu.gov.vn hoặc những đơn vị liên kết với chúng tôi. Ngoài ra, chúng tôi còn có thể liên hệ với khách hàng để biết đánh giá, ý kiến và quan điểm của khách hàng về những sản phẩm và những dịch vụ hiện tại hoặc những sản phẩm và dịch vụ mới tiềm năng có thể sẽ được ra mắt. Thông tin cá nhân của khách hàng có thể bị chia sẻ với những công ty khác, nhưng chỉ trong trường hợp cần thiết để đáp ứng các yêu cầu của khách hàng, hoặc sử dụng cho những mục đích liên quan.</div><div><strong>3. Thời gian lưu trữ thông tin</strong></div><div>Công ty có hệ thống máy chủ có khả năng lưu trữ thông tin khách hàng tối thiểu là 02 năm và tối đa là 10 năm. Trong quá trình hoạt động, công ty có thể nâng cao khả năng lưu trữ thông tin nếu cần thiết.</div><div><strong>4. Phương tiện và công cụ để người dùng tiếp cận và chỉnh sửa dữ liệu cá nhân của mình</strong></div><div>Người dùng có thể tiếp cận và chỉnh sửa trực tiếp dữ liệu cá nhân của mình thông qua website vanmieu.gov.vn bằng cách đăng nhập vào tài khoản mà mình đã đăng ký và sửa lại các thông tin, dữ liệu cá nhân của mình.</div><div>Việc đăng nhập có thể thực hiện trên máy tính, điện thoại, hay các công cụ khác có tính năng truy cập vào website.</div><div><strong>5. Cam kết bảo mật thông tin cá nhân khách hàng</strong></div><div>Chúng tôi chỉ tập hợp lại các thông tin cá nhân trong phạm vi phù hợp và cần thiết cho mục đích vận hành của chúng tôi. Và chúng tôi duy trì các biện pháp thích hợp nhằm đảm bảo tính an toàn, nguyên vẹn, độ chính xác, và tính bảo mật của những thông tin mà người sử dụng đã cung cấp. Ngoài ra, chúng tôi cũng có những biện pháp thích hợp để đảm bảo rằng bên thứ ba cũng sẽ đảm bảo an toàn cho các thông tin mà chúng tôi cung cấp cho họ.</div><div>Thông tin cá nhân, thông tin riêng của người sử dụng được thu thập, lưu trữ và bảo vệ một cách nghiêm túc, chính xác và bảo mật.</div><div>Chúng tôi thiết lập những phần mềm thu thập, lưu trữ thông tin riêng biệt và được thực hiện duy nhất bởi hệ thống máy chủ và hệ thống máy chủ dự phòng của chúng tôi.</div><div>Việc bảo mật các thông tin cá nhân, thông tin riêng của người sử dụng là tuyệt đối và sẽ không bị xuất trình cho bên thứ ba bất kỳ trừ khi có yêu cầu từ phía cơ quan Nhà nước có thẩm quyền. </div>',
          ),
        ),
      ),
    );
  }

  Widget _buildTextHtml(String title) {
    return Html(
      data: title,
      style: {
        "*": Style(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
        ),
        "div": Style(
          margin: const EdgeInsets.only(bottom: 5),
          padding: EdgeInsets.zero,
          fontSize: const FontSize(18.0),
          color: CustomColors.black333333,
          fontStyle: FontStyle.normal,
          textAlign: TextAlign.justify,
          fontFamily: 'LeagueSpartan',
          fontWeight: FontWeight.w300,
          lineHeight: LineHeight.number(1.1),
        ),
        "Strong": Style(
          margin: const EdgeInsets.only(top: 16, bottom: 5),
          padding: EdgeInsets.zero,
          fontSize: const FontSize(20.0),
          color: CustomColors.black333333,
          fontStyle: FontStyle.normal,
          textAlign: TextAlign.justify,
          fontFamily: 'LeagueSpartan',
          fontWeight: FontWeight.w500,
          lineHeight: LineHeight.number(1),
        ),
        "body": Style(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          fontSize: const FontSize(16.0),
          color: CustomColors.black333333,
          fontStyle: FontStyle.normal,
          textAlign: TextAlign.justify,
          fontFamily: 'LeagueSpartan',
          fontWeight: FontWeight.w300,
          letterSpacing: 0.5,
          lineHeight: LineHeight.number(1.1),
        ),
        'html': Style(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          fontSize: const FontSize(18.0),
          color: CustomColors.black333333,
          fontStyle: FontStyle.normal,
          textAlign: TextAlign.justify,
          fontFamily: 'LeagueSpartan',
          fontWeight: FontWeight.w300,
          // letterSpacing: 1,
          lineHeight: LineHeight.number(1.3),
        ),
      },
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
      backgroundColor: CustomColors.white,
      centerTitle: true,
      elevation: 1.0,
      title: Text(
        FlutterI18n.translate(context, 'security'),
        style: TxtStyle.Noto18w700.copyWith(
          color: CustomColors.black333333,
          fontSize: 18,
        ),
      ),
      leading: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Images.imageAssets(
          Images.ic_back,
          fit: BoxFit.scaleDown,
          color: CustomColors.green006338,
          height: 24,
          width: 24,
        ),
      ),
    );
  }
}
