import 'package:ar_book/styles/colors.dart';
import 'package:ar_book/styles/images/images.dart';
import 'package:ar_book/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class TermsOfUseScreen extends StatelessWidget {
  const TermsOfUseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 8,
          ),
          child: _buildTextHtml(
            '''<div><strong>1. Quy định chung</strong></div><div>Điều khoản sử dụng quy định các điều khoản ràng buộc bạn khi sử dụng các dịch vụ. Thuật ngữ “bạn" và/hoặc “người sử dụng” sau đây được gọi chung để chỉ tới những người sử dụng các dịch vụ. Vui lòng nghiên cứu kỹ và lưu lại một bản điều khoản sử dụng này.</div><div>Bằng việc ghé thăm website và sử dụng các dịch vụ, bạn đồng ý bị ràng buộc với điều khoản sử dụng này, chính sách quảng cáo và chính sách bảo mật của chúng tôi.</div><div>Chúng tôi thực hiện điều khoản sử dụng này, chính sách quảng cáo và chính sách bảo mật theo quy định của pháp luật hiện hành và không nội dung nào trong các tài liệu trên cản trở quyền của chúng tôi tuân thủ các quy định hoặc yêu cầu của chính phủ, tòa án, cơ quan thi hành án liên quan đến việc bạn sử dụng các dịch vụ hoặc thông tin do chúng tôi nhận được hoặc thu được từ việc sử dụng các dịch vụ của bạn.</div><div><strong>2. Từ chối đảm bảo</strong></div><div>Website  và các dịch vụ được cung cấp dựa trên nguyên tắc không bảo hành, trên cơ sở dịch vụ và tính năng sẵn có mà chúng tôi không đảm bảo rằng các tính năng trên website  hoặc các dịch vụ sẽ đáp ứng các yêu cầu của bạn hoặc đảm bảo rằng sự vận hành các phần mềm hoặc các dịch vụ sẽ không bị gián đoạn hoặc bị lỗi.</div><div>Chúng tôi không chịu trách nhiệm đối với bất kỳ sự mất mát dữ liệu, tổn thất lợi ích nào hoặc các vấn đề khác liên quan đến việc truy cập website  và sử dụng các dịch vụ, bao gồm nhưng không giới hạn đến tất cả các thông tin, dữ liệu, văn bản, phần mềm, âm nhạc, âm thanh, hình ảnh, đồ họa, video, thông điệp hoặc các nguyên liệu khác mà bạn có thể lưu giữ, đưa lên, hoặc truyền tải thông qua dịch vụ. bạn đồng ý sử dụng các dịch vụ với tất cả sự rủi ro.</div><div><strong>3. Thay đổi điều khoản sử dụng</strong></div><div>Chúng tôi giữ quyền thay đổi và/hoặc sửa đổi mà không cần báo trước bất kỳ điều khoản nào trong điều khoản sử dụng này tùy từng thời điểm. Những sự thay đổi và/hoặc sửa đổi như vậy sẽ có hiệu lực ngay khi đăng lên website . Nếu bạn tiếp tục truy cập  hoặc sử dụng các dịch vụ sau khi các thay đổi và/hoặc sửa đổi được đăng lên, bạn đã chấp nhận và đồng ý với các thay đổi và/hoặc sửa đổi đó.</div><div><strong>4. Quy định sử dụng dịch vụ</strong></div><div>Khi sử dụng dịch vụ của chúng tôi, bên cạnh việc phải ký hợp đồng dịch vụ theo mẫu do chúng tôi ban hành, bạn còn bị ràng buộc phải chấp thuận và tuân thủ các điều kiện quy định dưới đây :</div><div>– Thanh toán phí dịch vụ theo thỏa thuận</div><div>– Tuân thủ quy định của pháp luật</div><div>– Các tranh chấp xảy ra nếu có do hai bên thỏa thuận giải quyết trên cơ sở hợp tác và thỏa thuận.</div><div><strong>5. Quy định về đăng ký, sử dụng tài khoản và thanh toán phí dịch vụ</strong></div><div>Chúng tôi cung cấp các dịch vụ cho bạn hoàn toàn thông qua hệ thống trực tuyến của Website  từ khi bạn bắt đầu đăng ký tài khoản, lựa chọn dịch vụ cũng như tiến hành thanh toán phí dịch vụ mà bạn sử dụng dịch vụ của chúng tôi.</div><div>Bạn xác nhận và đồng ý rằng bạn đã nghiên cứu kỹ càng và sẽ tuân thủ đầy đủ các quy định về đăng ký tài khoản, phương thức tính phí và thanh toán chi phí được đăng trên Website  của chúng tôi (“quy định về đăng ký và sử dụng dịch vụ”). Bằng việc bạn xác nhận hoàn thành thủ tục đăng ký tài khoản trên website , bạn đã chấp nhận bị ràng buộc thực hiện đối với các quy định về đăng ký và sử dụng dịch vụ như vậy khi bạn sử dụng các dịch vụ.</div><div>Chúng tôi luôn thay đổi và/hoặc sửa đổi nội dung điều khoản sử dụng này cũng như các quy định về đăng ký và sử dụng dịch vụ với mục đích hoàn thiện tốt nhất nội dung các quy định và đáp ứng tối đa sự tiện dụng và hiệu quả khi bạn sử dụng các dịch vụ cũng như đảm bảo nâng cao lợi ích của chúng tôi khi cung cấp các dịch vụ.</div><div>Chúng tôi giữ quyền nhưng không có nghĩa vụ thông báo tới bạn đối với bất kỳ sự thay đổi và/hoặc sửa đổi các quy định về đăng ký và sử dụng dịch vụ. Những sự thay đổi và/hoặc sửa đổi như vậy sẽ có hiệu lực ngay khi đăng lên Website . Nếu bạn tiếp tục sử dụng các dịch vụ sau khi các thay đổi và/hoặc sửa đổi được đăng lên, bạn đã chấp nhận và đồng ý với các thay đổi và/hoặc sửa đổi đó. Chúng tôi khuyến nghị bạn thường xuyên kiểm tra trên Website  và liên hệ với nhân viên hỗ trợ của chúng tôi để có được bản cập nhật các quy định về đăng ký và sử dụng dịch vụ mới nhất.</div><div><strong>6. Giới hạn trách nhiệm</strong></div><div>bạn xác nhận và đồng ý rằng chúng tôi chỉ sẵn sàng cung cấp các dịch vụ nếu bạn đồng ý giới hạn trách nhiệm của chúng tôi đối với bạn và các bên thứ ba. bạn đồng ý rằng bạn chịu trách nhiệm bồi thường duy nhất và toàn bộ đối với bất kỳ khiếu nại, khiếu kiện nào tới chúng tôi liên quan đến bất kỳ sự vi phạm quy định sử dụng nào do việc bạn sử dụng các dịch vụ hoặc ngừng sử dụng dịch vụ của chúng tôi.</div><div>Bạn đồng ý tự chịu trách nhiệm với các nội dung và thông tin cung cấp cho chúng tôi.</div><div>Bạn đồng ý bảo vệ, bồi thường và giữ cho chúng tôi và các công ty liên kết của chúng tôi và mỗi nhân viên, giám đốc, người lao động, đại lý, đại diện, người cung cấp thông tin và bên cấp phép của chúng tôi không bị tổn hại bởi bất kỳ khiếu nại, khiếu kiện, chi phí, tổn thất, thiệt hại, phán quyết của tòa án và phí tổn nào, bao gồm nhưng không giới hạn phí luật sư, phí bồi thường thiệt hại, chi phí tố tụng, lãi chậm trả liên quan đến hoặc phát sinh từ bất kỳ khiếu nại, mâu thuẫn, tranh chấp, thủ tục tố tụng pháp lý tại Tòa án hoặc các tổ chức Trọng tài, tổ chức Hòa giải, các quyết định của cơ quan nhà nước có thẩm quyền … liên quan đến hoặc phát sinh từ các sản phẩm và dịch vụ. Chúng tôi giữ quyền, bằng chi phí của mình, đảm nhận hoàn toàn việc bảo vệ và kiểm soát (nhưng không có trách nhiệm) đối với bất kỳ vấn đề nào phát sinh như vậy tùy thuộc vào sự bồi thường của bạn.</div><div><strong>7. Bảo vệ bản quyền và quyền sở hữu trí tuệ khác với các sản phẩm và dịch vụ của chúng tôi</strong></div><div>Các dịch vụ, và tất cả các phần mềm cần thiết, nguyên liệu cấu thành của dịch vụ và khai thác, triển khai dịch vụ, và bao gồm cả các quyền sở hữu trí tuệ đối với các dịch vụ và sản phẩm của chúng tôi, và tất cả các phần mềm cần thiết, nguyên liệu cấu thành của dịch vụ (“Sở hữu Trí tuệ”), được bảo vệ bởi bản quyền, quyền về thương hiệu, nhãn dịch vụ, hoặc quyền tài sản khác do chúng tôi sở hữu hoặc được sở hữu bởi bên thứ ba nào mà đã cấp quyền sở hữu trí tuệ cho chúng tôi. Bạn không được quyền sử dụng bất kỳ tên thương mại, nhãn hiệu của hàng hóa và dịch vụ, biểu tượng, tên miền và các hình thức nhận diện hàng hóa, dịch vụ đặc trưng nào khác của chúng tôi vào mục đích thương mại trừ khi bạn được sự chấp thuận bằng văn bản của chúng tôi, hoặc việc sử dụng của bạn gây ảnh hưởng, cản trở, tác động xấu tới việc hoạt động bình thường của các sản phẩm và dịch vụ, uy tín của chúng tôi.</div><div>Chúng tôi tôn trọng quyền sở hữu trí tuệ của người khác và yêu cầu Người sử dụng các dịch vụ cũng như vậy. Bạn không được tải lên, gắn vào, đăng lên, truyền đi hoặc bằng cách khác tạo sẵn bất kỳ nguyên liệu cấu thành nào gây ảnh hưởng đến bất kỳ quyền sở hữu trí tuệ về bản quyền, thương hiệu, bí mật thương mại hoặc quyền tài sản khác của bất kỳ tổ chức hoặc cá nhân nào. Chúng tôi có quyền chấm dứt đường truy cập vào các dịch vụ hoặc bất kỳ dịch vụ nào khác do chúng tôi cung cấp đối với người bị nghi ngờ xâm phạm.</div><div><strong>8. Điều khoản khác</strong></div><div><strong><em>Luật điều chỉnh</em></strong></div><div>Điều khoản sử dụng này được điều chỉnh bởi và giải thích phù hợp với pháp luật Việt Nam. Nếu bất kỳ điều khoản nào trong điều khoản sử dụng này không hợp pháp, vô hiệu hoặc vì bất kỳ lý do nào không thể thực hiện được, thì điều khoản đó sẽ được xem là tách rời khỏi điều khoản sử dụng này và không ảnh hưởng đến hiệu lực và tính thực thi của bất kỳ điều khoản còn lại nào của điều khoản sử dụng này.</div><div><strong><em>Chấm dứt</em></strong></div><div>Điều khoản sử dụng này có hiệu lực cho đến khi bị chấm dứt bởi bạn hoặc bởi chúng tôi theo các trường hợp sau đây:</div><div>Chấm dứt bởi bạn: Bạn có thể chấm dứt điều khoản sử dụng này bằng cách không sử dụng các dịch vụ nữa.</div><div>Chấm dứt bởi chúng tôi: điều khoản sử dụng này chấm dứt ngay lập tức mà chúng tôi không cần phải thông báo trước, bạn không tuân thủ bất kỳ điều khoản nào của điều khoản sử dụng này hoặc pháp luật hoặc quyết định của chính phủ, tòa án, cơ quan thi hành án yêu cầu chúng tôi chấm dứt điều khoản sử dụng.</div><div><strong><em>Liên hệ</em></strong></div><div>Nếu bạn có bất kỳ câu hỏi nào về điều khoản sử dụng này, về hoạt động của các dịch vụ, hoặc sự kết nối của bạn với chúng tôi, vui lòng liên hệ với chúng tôi qua điện thoại: +0262 625 3636 (0903 524 885). Tất cả các vấn đề hoặc mâu thuẫn sẽ được giải quyết nhanh chóng và hợp lý</div>''',
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
          margin: EdgeInsets.only(bottom: 5),
          padding: EdgeInsets.zero,
          fontSize: const FontSize(16.0),
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
          fontSize: const FontSize(18.0),
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
      ),
      backgroundColor: CustomColors.white,
      centerTitle: true,
      elevation: 1.0,
      title: Text(
        FlutterI18n.translate(context, 'termsOfuse'),
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
