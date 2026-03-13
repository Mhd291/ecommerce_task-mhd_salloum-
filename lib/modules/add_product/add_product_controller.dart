import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:easy_localization/easy_localization.dart' as ez;
import '../../core/shared/widgets/snackbar_def.dart';
import 'add_product_service.dart';
import '../../generated/locale_keys.g.dart';

class AddProductController extends GetxController {
  final AddProductService service;

  AddProductController(this.service);

  late final TextEditingController nameController;
  late final TextEditingController categoryController;
  late final TextEditingController descriptionController;
  late final TextEditingController priceController;

  final RxList<File> images = <File>[].obs;
  final RxBool isLoading = false.obs;

  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();

    nameController = TextEditingController();
    categoryController = TextEditingController();
    descriptionController = TextEditingController();
    priceController = TextEditingController();
  }

  /// ================= PICK MULTIPLE IMAGES =================
  Future<void> pickImages() async {
    final picked = await _picker.pickMultiImage();
    if (picked.isEmpty) return;

    images.addAll(picked.map((e) => File(e.path)));
  }

  void removeImage(int index) {
    if (index < images.length) {
      images.removeAt(index);
    }
  }

  /// ================= VALIDATE FORM =================
  bool _validateForm() {
    if (nameController.text.trim().isEmpty ||
        categoryController.text.trim().isEmpty ||
        descriptionController.text.trim().isEmpty ||
        priceController.text.trim().isEmpty) {
      snackBarDef(
        title: ez.tr(LocaleKeys.error),
        message: ez.tr(LocaleKeys.allFieldsRequired),
        isBottom: false,
      );
      return false;
    }

    if (images.isEmpty) {
      snackBarDef(
        title: ez.tr(LocaleKeys.error),
        message: ez.tr(LocaleKeys.selectAtLeastOneImage),
        isBottom: false,
      );
      return false;
    }

    return true;
  }

  /// ================= SAVE PRODUCT =================
  Future<void> saveProduct() async {
    if (!_validateForm()) return;

    try {
      isLoading.value = true;

      final success = await service.createProduct(
        title: nameController.text.trim(),
        description: descriptionController.text.trim(),
        category: categoryController.text.trim(),
        price: priceController.text.trim(),
        images: images.toList(),
      );

      if (success) {
        snackBarDef(
          title: ez.tr(LocaleKeys.success),
          message: ez.tr(LocaleKeys.productCreated),
          isBottom: true,
        );
        clearForm();
      } else {
        snackBarDef(
          title: ez.tr(LocaleKeys.error),
          message: ez.tr(LocaleKeys.productCreationFailed),
          isBottom: true,
        );
      }
    } catch (e) {
      Get.snackbar(
        ez.tr(LocaleKeys.error),
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  /// ================= CLEAR FORM =================
  void clearForm() {
    nameController.clear();
    categoryController.clear();
    descriptionController.clear();
    priceController.clear();
    images.clear();
  }

  @override
  void onClose() {
    nameController.dispose();
    categoryController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    super.onClose();
  }
}