import 'dart:async';
import 'dart:convert';
import 'dart:html' as html;
import 'dart:ui' as ui;
import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quest/components/color.dart';
import 'package:url_launcher/url_launcher.dart';

// AddressSearchField 위젯 정의 (기존과 동일)
class AddressSearchField extends StatefulWidget {
  final TextEditingController controller;
  final TextEditingController detailController;
  final String labelText;
  final FocusNode? focusNode;
  final FocusNode? detailFocusNode;
  final FocusNode? nextFocusNode;

  const AddressSearchField({
    Key? key,
    required this.controller,
    required this.detailController,
    this.labelText = '주소 입력',
    this.focusNode,
    this.detailFocusNode,
    this.nextFocusNode,
  }) : super(key: key);

  @override
  State<AddressSearchField> createState() => _AddressSearchFieldState();
}

class _AddressSearchFieldState extends State<AddressSearchField> {
  @override
  void initState() {
    super.initState();
    html.window.addEventListener('message', (event) {
      if (event is html.MessageEvent) {
        try {
          final data = json.decode(event.data);
          if (data['type'] == 'address') {
            if (mounted) {
              setState(() {
                widget.controller.text = data['address'];
                if (widget.detailFocusNode != null) {
                  FocusScope.of(context).requestFocus(widget.detailFocusNode);
                }
              });
            } else {
              widget.controller.text = data['address'];
            }
          }
        } catch (e) {
          print('Error parsing message: $e');
        }
      }
    });
  }

  @override
  void dispose() {
    html.window.removeEventListener('message', (event) {});
    super.dispose();
  }

  void searchAddress() {
    js.context.callMethod('eval', ['searchAddress()']);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth <= 768;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText.isNotEmpty) ...[
          Text(
            widget.labelText,
            style: TextStyle(
              fontSize: isMobile ? 12 : 14,
              color: AppColor.font1,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: isMobile ? 8 : 12),
        ],
        Container(
          width: isMobile ? double.infinity : 540,
          height: 54,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey[300]!),
            color: Colors.transparent,
          ),
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: TextFormField(
            controller: widget.controller,
            focusNode: widget.focusNode,
            textInputAction: TextInputAction.next,
            readOnly: true,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: '주소를 검색해 주세요',
              hintStyle: TextStyle(
                fontSize: isMobile ? 14 : 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            onTap: searchAddress,
            onFieldSubmitted: (_) {
              if (widget.detailFocusNode != null) {
                FocusScope.of(context).requestFocus(widget.detailFocusNode);
              }
            },
          ),
        ),
        SizedBox(height: isMobile ? 8 : 12),
        Container(
          width: isMobile ? double.infinity : 540,
          height: 54,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey[300]!),
            color: Colors.transparent,
          ),
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: TextFormField(
            controller: widget.detailController,
            focusNode: widget.detailFocusNode,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: '상세 주소를 입력해 주세요',
              hintStyle: TextStyle(
                fontSize: isMobile ? 14 : 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            onFieldSubmitted: (_) {
              if (widget.nextFocusNode != null) {
                FocusScope.of(context).requestFocus(widget.nextFocusNode);
              }
            },
          ),
        ),
      ],
    );
  }
}

class Desktop9 extends StatefulWidget {
  const Desktop9({super.key});

  @override
  State<Desktop9> createState() => _Desktop9State();
}

class _Desktop9State extends State<Desktop9> {
  String? selectedDomain;
  final TextEditingController domainController = TextEditingController();
  bool? posterAgreement;
  final TextEditingController addressController = TextEditingController();
  final TextEditingController detailAddressController = TextEditingController();

  // 추가 controller들
  final TextEditingController nameController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController schoolNameController = TextEditingController();
  final TextEditingController schoolNumberController = TextEditingController();
  final TextEditingController directNumberController = TextEditingController();

  // FocusNode 추가
  final FocusNode addressFocusNode = FocusNode();
  final FocusNode detailAddressFocusNode = FocusNode();

  // 폼 검증을 위한 상태 변수
  bool isFormValid = false;

  @override
  void initState() {
    super.initState();
    posterAgreement = true;

    // 모든 컨트롤러에 리스너 추가
    nameController.addListener(_validateForm);
    contactController.addListener(_validateForm);
    emailController.addListener(_validateForm);
    domainController.addListener(_validateForm);
    schoolNameController.addListener(_validateForm);
    schoolNumberController.addListener(_validateForm);
    directNumberController.addListener(_validateForm);
    addressController.addListener(_validateForm);
    detailAddressController.addListener(_validateForm);

    // EmailJS 결과 처리를 위한 PostMessage 리스너 추가
    html.window.addEventListener('message', (event) {
      if (event is html.MessageEvent) {
        try {
          final data = json.decode(event.data);
          if (data['type'] == 'email_success') {
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('✅ 이메일이 성공적으로 전송되었습니다!'),
                  backgroundColor: Colors.green,
                  duration: Duration(seconds: 3),
                ),
              );
              _clearForm();
            }
          } else if (data['type'] == 'email_error') {
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      '❌ 이메일 전송 실패: ${data['data']['text'] ?? '알 수 없는 오류'}'),
                  backgroundColor: Colors.red,
                  duration: Duration(seconds: 5),
                ),
              );
            }
          }
        } catch (e) {
          print('PostMessage 파싱 오류: $e');
        }
      }
    });

    setState(() {});
  }

  @override
  void dispose() {
    domainController.dispose();
    addressController.dispose();
    detailAddressController.dispose();
    nameController.dispose();
    contactController.dispose();
    emailController.dispose();
    schoolNameController.dispose();
    schoolNumberController.dispose();
    directNumberController.dispose();
    addressFocusNode.dispose();
    detailAddressFocusNode.dispose();
    super.dispose();
  }

  // 폼 검증 함수
  void _validateForm() {
    final name = nameController.text.trim();
    final contact = contactController.text.trim();
    final email = emailController.text.trim();
    final domain = domainController.text.trim();
    final selectedDomainValue = selectedDomain;
    final schoolName = schoolNameController.text.trim();
    final schoolNumber = schoolNumberController.text.trim();
    final directNumber = directNumberController.text.trim();
    final address = addressController.text.trim();
    final detailAddress = detailAddressController.text.trim();

    bool isValid = name.isNotEmpty &&
        contact.isNotEmpty &&
        email.isNotEmpty &&
        (domain.isNotEmpty ||
            (selectedDomainValue != null && selectedDomainValue != '직접 입력')) &&
        schoolName.isNotEmpty &&
        schoolNumber.isNotEmpty &&
        directNumber.isNotEmpty;

    // 포스터 수령 동의 시 주소도 필수
    if (posterAgreement == true) {
      isValid = isValid && address.isNotEmpty && detailAddress.isNotEmpty;
    }

    setState(() {
      isFormValid = isValid;
    });
  }

  // ⭐ 수정된 이메일 전송 함수 - 간단하고 안전한 파라미터만 전송
  Future<void> _sendEmail() async {
    try {
      // 폼 데이터 수집 및 정리
      final name = nameController.text.trim();
      final contact = contactController.text.trim();
      final email = emailController.text.trim() +
          '@' +
          (domainController.text.isEmpty
              ? selectedDomain ?? ''
              : domainController.text.trim());
      final schoolName = schoolNameController.text.trim();
      final schoolNumber = schoolNumberController.text.trim();
      final directNumber = directNumberController.text.trim();
      final address = addressController.text.trim();
      final detailAddress = detailAddressController.text.trim();
      final posterAgree = posterAgreement == true ? '동의' : '비동의';

      // 현재 시간을 간단한 형식으로
      final now = DateTime.now();
      final timeString =
          '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';

      // ⭐ 중요: 간단하고 확실한 파라미터만 전송
      final templateParams = {
        // 기본 정보
        'name': name,
        'contact': contact,
        'email': email,

        // 학교 정보
        'schoolName': schoolName,
        'schoolNumber': schoolNumber,
        'directNumber': directNumber,

        // 포스터 수령 정보 (조건부가 아닌 항상 전송)
        'posterAgree': posterAgree,
        'address': posterAgreement == true ? address : '수령 비동의',
        'detailAddress': posterAgreement == true ? detailAddress : '',

        // 시간
        'time': timeString,
      };

      print('📧 전송할 파라미터: ${json.encode(templateParams)}');

      // EmailJS 초기화 체크
      js.context.callMethod('eval', [
        'if (typeof emailjs === "undefined") { console.error("❌ EmailJS가 로드되지 않았습니다!"); throw new Error("EmailJS not loaded"); }'
      ]);

      // 안전한 EmailJS 호출 - 성공/실패 콜백 포함
      final jsCode = '''
        console.log('📤 이메일 전송 시작...');
        console.log('전송 파라미터:', ${json.encode(templateParams)});
        
        emailjs.send("school", "template_d73oau3", ${json.encode(templateParams)}, "dv2MXIIsVGZIIzcSk")
          .then(function(response) {
            console.log("✅ 이메일 전송 성공!", response);
            console.log("Status:", response.status, "Text:", response.text);
            window.postMessage(JSON.stringify({
              type: "email_success", 
              data: {
                status: response.status,
                message: "이메일이 성공적으로 전송되었습니다!"
              }
            }), "*");
          })
          .catch(function(error) {
            console.error("❌ 이메일 전송 실패:", error);
            window.postMessage(JSON.stringify({
              type: "email_error", 
              data: {
                text: error.text || error.toString(),
                message: "이메일 전송에 실패했습니다"
              }
            }), "*");
          });
      ''';

      js.context.callMethod('eval', [jsCode]);

      // 즉시 대기 메시지 표시
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('📧 이메일 전송 중... 잠시 기다려주세요.'),
          backgroundColor: Colors.orange,
          duration: Duration(seconds: 3),
        ),
      );
    } catch (e) {
      print('❌ 이메일 전송 중 오류 발생: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('오류가 발생했습니다: $e'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 5),
        ),
      );
    }
  }

  // 폼 초기화 함수
  void _clearForm() {
    nameController.clear();
    contactController.clear();
    emailController.clear();
    domainController.clear();
    schoolNameController.clear();
    schoolNumberController.clear();
    directNumberController.clear();
    addressController.clear();
    detailAddressController.clear();
    setState(() {
      selectedDomain = null;
      posterAgreement = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth <= 768;

    return RepaintBoundary(
        child: Scaffold(
            backgroundColor: const Color(0xffFFFFFF),
            body: Column(
              children: [
                Expanded(
                  child: Container(
                      width: isMobile ? double.infinity : 1320,
                      padding: EdgeInsets.only(
                          top: isMobile ? 60 : 120,
                          left: isMobile ? 20 : 300,
                          right: isMobile ? 20 : 300),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '학교 코드 조회',
                            style: TextStyle(
                                fontSize: isMobile ? 16 : 20,
                                fontWeight: FontWeight.w600,
                                color: AppColor.font1),
                          ),
                          SizedBox(height: isMobile ? 16 : 24),
                          Text(
                            '퀘스트스쿨 회원가입을 위해\n학교 코드를 입력해주세요.',
                            style: TextStyle(
                                fontSize: isMobile ? 24 : 32,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                          SizedBox(height: isMobile ? 40 : 80),
                          Text(
                            '기본 정보 입력',
                            style: TextStyle(
                                fontSize: isMobile ? 20 : 24,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          SizedBox(height: isMobile ? 8 : 12),
                          Container(
                            width: isMobile ? double.infinity : 1600,
                            height: 2,
                            color: Colors.black,
                          ),
                          SizedBox(height: isMobile ? 16 : 24),

                          // 이름 입력
                          Row(
                            children: [
                              Text('이름',
                                  style: TextStyle(
                                      fontSize: isMobile ? 14 : 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black)),
                              Text('*',
                                  style: TextStyle(
                                      fontSize: isMobile ? 14 : 16,
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.font1)),
                            ],
                          ),
                          SizedBox(height: isMobile ? 8 : 12),
                          Container(
                            width: isMobile ? double.infinity : 540,
                            height: 54,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey[300]!),
                              color: Colors.transparent,
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 10),
                            child: TextFormField(
                              controller: nameController,
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '이름을 입력해주세요.',
                                hintStyle: TextStyle(
                                    fontSize: isMobile ? 14 : 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey[600]),
                              ),
                            ),
                          ),
                          SizedBox(height: isMobile ? 24 : 36),

                          // 연락처 입력
                          Row(
                            children: [
                              Text('연락처',
                                  style: TextStyle(
                                      fontSize: isMobile ? 14 : 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black)),
                              Text('*',
                                  style: TextStyle(
                                      fontSize: isMobile ? 14 : 16,
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.font1)),
                            ],
                          ),
                          SizedBox(height: isMobile ? 8 : 12),
                          Container(
                            width: isMobile ? double.infinity : 540,
                            height: 54,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey[300]!),
                              color: Colors.transparent,
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 10),
                            child: TextFormField(
                              controller: contactController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '하이픈(-)을 빼고 입력해주세요.',
                                hintStyle: TextStyle(
                                    fontSize: isMobile ? 14 : 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey[600]),
                              ),
                            ),
                          ),
                          SizedBox(height: isMobile ? 24 : 36),

                          // 이메일 입력
                          Row(
                            children: [
                              Text('이메일',
                                  style: TextStyle(
                                      fontSize: isMobile ? 14 : 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black)),
                              Text('*',
                                  style: TextStyle(
                                      fontSize: isMobile ? 14 : 16,
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.font1)),
                            ],
                          ),
                          SizedBox(height: isMobile ? 8 : 12),
                          isMobile
                              ? Column(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 54,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            color: Colors.grey[300]!),
                                        color: Colors.transparent,
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 10),
                                      child: TextFormField(
                                        controller: emailController,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: '이메일',
                                          hintStyle: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey[600]),
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            height: 54,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              border: Border.all(
                                                  color: Colors.grey[300]!),
                                              color: Colors.transparent,
                                            ),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 12, vertical: 10),
                                            child: TextFormField(
                                              controller: domainController,
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: '직접 입력',
                                                hintStyle: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.grey[600]),
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Container(
                                          width: 120,
                                          height: 54,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 12),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                                color: Colors.grey[300]!),
                                            color: Colors.transparent,
                                          ),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton<String>(
                                              value: selectedDomain,
                                              hint: Text('도메인',
                                                  style: TextStyle(
                                                      color: Colors.grey[600],
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14)),
                                              dropdownColor: Colors.white,
                                              focusColor: Colors.white,
                                              items: <String>[
                                                'gmail.com',
                                                'naver.com',
                                                'daum.net',
                                                '직접 입력'
                                              ].map((String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Container(
                                                    color: Colors.transparent,
                                                    child: Text(value,
                                                        style: TextStyle(
                                                            fontSize: 14)),
                                                  ),
                                                );
                                              }).toList(),
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  selectedDomain = newValue;
                                                  if (newValue != null &&
                                                      newValue != '직접 입력') {
                                                    domainController.text =
                                                        newValue;
                                                  } else if (newValue ==
                                                      '직접 입력') {
                                                    domainController.clear();
                                                  }
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              : Row(
                                  children: [
                                    Container(
                                      width: 200,
                                      height: 54,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            color: Colors.grey[300]!),
                                        color: Colors.transparent,
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 10),
                                      child: TextFormField(
                                        controller: emailController,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: '이메일',
                                          hintStyle: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey[600]),
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Text('@',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(width: 8),
                                    Container(
                                      width: 200,
                                      height: 54,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            color: Colors.grey[300]!),
                                        color: Colors.transparent,
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 10),
                                      child: TextFormField(
                                        controller: domainController,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: '직접 입력',
                                          hintStyle: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey[600]),
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Container(
                                      width: 200,
                                      height: 54,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 12),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            color: Colors.grey[300]!),
                                        color: Colors.transparent,
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          value: selectedDomain,
                                          hint: Text('직접 입력',
                                              style: TextStyle(
                                                  color: Colors.grey[600],
                                                  fontWeight: FontWeight.w500)),
                                          dropdownColor: Colors.white,
                                          focusColor: Colors.white,
                                          items: <String>[
                                            'gmail.com',
                                            'naver.com',
                                            'daum.net',
                                            '직접 입력'
                                          ].map((String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Container(
                                                color: Colors.transparent,
                                                child: Text(value),
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              selectedDomain = newValue;
                                              if (newValue != null &&
                                                  newValue != '직접 입력') {
                                                domainController.text =
                                                    newValue;
                                              } else if (newValue == '직접 입력') {
                                                domainController.clear();
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                          SizedBox(height: isMobile ? 40 : 64),

                          // 학교 정보 입력 섹션
                          Text('학교 정보 입력',
                              style: TextStyle(
                                  fontSize: isMobile ? 20 : 24,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black)),
                          SizedBox(height: isMobile ? 8 : 12),
                          Container(
                              width: isMobile ? double.infinity : 1600,
                              height: 2,
                              color: Colors.black),
                          SizedBox(height: isMobile ? 16 : 24),

                          // 학교명
                          Row(
                            children: [
                              Text('학교명',
                                  style: TextStyle(
                                      fontSize: isMobile ? 14 : 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black)),
                              Text('*',
                                  style: TextStyle(
                                      fontSize: isMobile ? 14 : 16,
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.font1)),
                            ],
                          ),
                          SizedBox(height: isMobile ? 8 : 12),
                          Container(
                            width: isMobile ? double.infinity : 540,
                            height: 54,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey[300]!),
                              color: Colors.transparent,
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 10),
                            child: TextFormField(
                              controller: schoolNameController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '학교명을 입력해주세요.',
                                hintStyle: TextStyle(
                                    fontSize: isMobile ? 14 : 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey[600]),
                              ),
                            ),
                          ),
                          SizedBox(height: isMobile ? 24 : 36),

                          // 학교 고유번호
                          Row(
                            children: [
                              Text('신청 학교 고유번호(사업자번호)',
                                  style: TextStyle(
                                      fontSize: isMobile ? 14 : 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black)),
                              Text('*',
                                  style: TextStyle(
                                      fontSize: isMobile ? 14 : 16,
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.font1)),
                            ],
                          ),
                          SizedBox(height: isMobile ? 8 : 12),
                          Container(
                            width: isMobile ? double.infinity : 540,
                            height: 54,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey[300]!),
                              color: Colors.transparent,
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 10),
                            child: TextFormField(
                              controller: schoolNumberController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '고유번호(사업자번호)를 입력해 주세요',
                                hintStyle: TextStyle(
                                    fontSize: isMobile ? 14 : 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey[600]),
                              ),
                            ),
                          ),
                          SizedBox(height: isMobile ? 24 : 36),

                          // 직통번호
                          Row(
                            children: [
                              Text('본인 직통 번호(교내 연락처)',
                                  style: TextStyle(
                                      fontSize: isMobile ? 14 : 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black)),
                              Text('*',
                                  style: TextStyle(
                                      fontSize: isMobile ? 14 : 16,
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.font1)),
                            ],
                          ),
                          SizedBox(height: isMobile ? 8 : 12),
                          Container(
                            width: isMobile ? double.infinity : 540,
                            height: 54,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey[300]!),
                              color: Colors.transparent,
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 10),
                            child: TextFormField(
                              controller: directNumberController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '학교의 본인 직통 번호(교내 연락처)를 입력해 주세요',
                                hintStyle: TextStyle(
                                    fontSize: isMobile ? 14 : 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey[600]),
                              ),
                            ),
                          ),
                          SizedBox(height: isMobile ? 6 : 8),
                          Text(
                            '담당자 확인 후, 학교 코드 안내 메일을 보내드립니다.',
                            style: TextStyle(
                                fontSize: isMobile ? 12 : 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[600]),
                          ),
                          SizedBox(height: isMobile ? 40 : 64),

                          // 포스터 수령 섹션
                          Text('포스터 수령',
                              style: TextStyle(
                                  fontSize: isMobile ? 20 : 24,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black)),
                          SizedBox(height: isMobile ? 8 : 12),
                          Container(
                              width: isMobile ? double.infinity : 1600,
                              height: 2,
                              color: Colors.black),
                          SizedBox(height: isMobile ? 16 : 24),

                          // 포스터 수령 동의
                          Row(
                            children: [
                              Text('퀘스트스쿨 포스터 수령',
                                  style: TextStyle(
                                      fontSize: isMobile ? 14 : 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black)),
                            ],
                          ),
                          SizedBox(height: isMobile ? 8 : 12),
                          Row(
                            children: [
                              Radio<bool>(
                                value: true,
                                groupValue: posterAgreement,
                                activeColor: AppColor.font1,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                visualDensity: VisualDensity.compact,
                                onChanged: (bool? value) {
                                  setState(() {
                                    posterAgreement = value;
                                  });
                                  _validateForm();
                                },
                              ),
                              Text('동의',
                                  style:
                                      TextStyle(fontSize: isMobile ? 14 : 16)),
                              SizedBox(width: 20),
                              Radio<bool>(
                                value: false,
                                groupValue: posterAgreement,
                                activeColor: AppColor.font1,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                visualDensity: VisualDensity.compact,
                                onChanged: (bool? value) {
                                  setState(() {
                                    posterAgreement = value;
                                  });
                                  _validateForm();
                                },
                              ),
                              Text('비동의',
                                  style:
                                      TextStyle(fontSize: isMobile ? 14 : 16)),
                            ],
                          ),

                          // 포스터 수령 주소 입력 (동의 시에만 표시)
                          if (posterAgreement == true) ...[
                            SizedBox(height: isMobile ? 24 : 36),
                            Row(
                              children: [
                                Text('퀘스트스쿨 포스터 수령 주소',
                                    style: TextStyle(
                                        fontSize: isMobile ? 14 : 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black)),
                              ],
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            AddressSearchField(
                              controller: addressController,
                              detailController: detailAddressController,
                              labelText: '',
                              focusNode: addressFocusNode,
                              detailFocusNode: detailAddressFocusNode,
                            ),
                          ],
                          SizedBox(height: isMobile ? 40 : 64),

                          // 제출 버튼
                          Center(
                            child: GestureDetector(
                              onTap: isFormValid ? _sendEmail : null,
                              child: Container(
                                width: isMobile ? 120 : 102,
                                height: 56,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: isFormValid
                                        ? AppColor.font1
                                        : Colors.grey[400]),
                                child: Center(
                                  child: Text(
                                    '제출하기',
                                    style: TextStyle(
                                        fontSize: isMobile ? 16 : 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: isMobile ? 60 : 120),
                        ],
                      )),
                ),

                // 하단 푸터
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: isMobile ? 400 : 330,
                  color: Colors.grey[100],
                  child: Center(
                    child: isMobile
                        ? Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 180,
                                  height: 25,
                                  child: Image.asset(
                                    'assets/images/blogo.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  '퀘스트스쿨은 진로 콘텐츠 전문 기업 사자가온다(주)에서\n개발한 교내 진로진학 상담 솔루션 서비스입니다.',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 30),
                                Text(
                                  'Copyright ⓒ 2023 사자가온다㈜ All rights reserved.',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 30),
                                Row(
                                  children: [
                                    Text(
                                      '회사 소개',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    Text(
                                      '듀토리얼 확인하기',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    Text(
                                      '문의하기',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Text(
                                  'AM 10:00 - PM 18:00',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 6),
                                Text(
                                  '점심 PM 12:00 - PM 13:00',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 6),
                                Text(
                                  '공휴일,주말 휴무',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 215,
                                    height: 30,
                                    child: Image.asset(
                                      'assets/images/blogo.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  SizedBox(height: 24),
                                  Text(
                                    '퀘스트스쿨은 진로 콘텐츠 전문 기업 사자가온다(주)에서\n개발한 교내 진로진학 상담 솔루션 서비스입니다.',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[700],
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                  Text(
                                    'Copyright ⓒ 2023 사자가온다㈜ All rights reserved.',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey[700],
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '회사 소개',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey[700],
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(width: 32),
                                      Text(
                                        '듀토리얼 확인하기',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey[700],
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(width: 32),
                                      Text(
                                        '문의하기',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey[700],
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 72),
                                  Text(
                                    'AM 10:00 - PM 18:00',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[700],
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    '점심 PM 12:00 - PM 13:00',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[700],
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    '공휴일,주말 휴무',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[700],
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                  ),
                ),
              ],
            )));
  }
}
