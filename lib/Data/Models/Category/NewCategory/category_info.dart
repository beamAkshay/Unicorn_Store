// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';
part 'category_info.g.dart';

@JsonSerializable()
class CategoryInfo {
  final int? id;
  final int? parent_id;
  final String? name;
  final String? slug;
  final int? route_id;
  final String? description;
  final String? excerpt;
  final int? sequence;
  final String? image;
  final String? seo_title;
  final String? meta;
  final int? enabled;
  final int? is_navigable;
  final int? cat_meta;
  final String? cat_badge;
  final List<CategoryInfo>? children;
  final bool? accessories;
  final bool? watch;

  CategoryInfo({
    this.id,
    this.parent_id,
    this.name,
    this.slug,
    this.route_id,
    this.description,
    this.excerpt,
    this.sequence,
    this.image,
    this.seo_title,
    this.meta,
    this.enabled,
    this.is_navigable,
    this.cat_meta,
    this.cat_badge,
    required this.children,
    this.accessories,
    this.watch,
  });

  factory CategoryInfo.fromJson(Map<String, dynamic> category) =>
      _$CategoryInfoFromJson(category);
  Map<String, dynamic> toJson() => _$CategoryInfoToJson(this);

  @override
  String toString() {
    return 'CategoryInfo(id: $id, parent_id: $parent_id, name: $name, slug: $slug, route_id: $route_id, description: $description, excerpt: $excerpt, sequence: $sequence, image: $image, seo_title: $seo_title, meta: $meta, enabled: $enabled, is_navigable: $is_navigable, cat_meta: $cat_meta, cat_badge: $cat_badge, children: $children, accessories: $accessories, watch: $watch)';
  }
}
