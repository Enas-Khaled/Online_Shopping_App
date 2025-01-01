prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- Oracle APEX export file
--
-- You should run this script using a SQL client connected to the database as
-- the owner (parsing schema) of the application or as a database user with the
-- APEX_ADMINISTRATOR_ROLE role.
--
-- This export file has been automatically generated. Modifying this file is not
-- supported by Oracle and can lead to unexpected application and/or instance
-- behavior now or in the future.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_imp.import_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.5'
,p_default_workspace_id=>40889977819388303803
,p_default_application_id=>200636
,p_default_id_offset=>0
,p_default_owner=>'WKSP_ENASWS'
);
end;
/
 
prompt APPLICATION 200636 - Online Shopping Application
--
-- Application Export:
--   Application:     200636
--   Name:            Online Shopping Application
--   Exported By:     ENAS.AH.KHALED@GMAIL.COM
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 16
--   Manifest End
--   Version:         24.1.5
--   Instance ID:     63113759365424
--

begin
null;
end;
/
prompt --application/pages/delete_00016
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>16);
end;
/
prompt --application/pages/page_00016
begin
wwv_flow_imp_page.create_page(
 p_id=>16
,p_name=>'Shopping Cart'
,p_alias=>'SHOPPING-CART'
,p_step_title=>'Shopping Cart'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(103907836396605800509)
,p_plug_name=>'Shopping Cart'
,p_title=>'Shopping Cart'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(101794937050115305504)
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT seq_id item,',
' p.product_image,',
' p.product_id,',
' p.product_name name,',
' p.unit_price,',
' n002 quantity,',
' p.unit_price* n002 subtotal,',
' b.brand',
'FROM apex_collections a,',
' products p,',
' json_table (p.product_details, ''$'' columns ( brand',
'varchar2(4000) path ''$.brand'') ) b',
'WHERE collection_name = ''PRODUCTS''',
'AND p.product_id = a.n001'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_plug_query_no_data_found=>'Your shopping cart is empty!'
,p_no_data_found_icon_classes=>'fa-cart-empty'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(103907836481274800510)
,p_region_id=>wwv_flow_imp.id(103907836396605800509)
,p_layout_type=>'ROW'
,p_title_adv_formatting=>false
,p_title_column_name=>'NAME'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'BRAND'
,p_body_adv_formatting=>true
,p_body_html_expr=>'Quantity: &QUANTITY.'
,p_second_body_adv_formatting=>true
,p_second_body_html_expr=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<b>Unit Price: &UNIT_PRICE. </b> <BR>',
'<b>Subtotal: &SUBTOTAL. </b>'))
,p_media_adv_formatting=>false
,p_media_source_type=>'BLOB'
,p_media_blob_column_name=>'PRODUCT_IMAGE'
,p_media_display_position=>'BODY'
,p_media_sizing=>'FIT'
,p_pk1_column_name=>'ITEM'
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(103907836571482800511)
,p_card_id=>wwv_flow_imp.id(103907836481274800510)
,p_action_type=>'BUTTON'
,p_position=>'PRIMARY'
,p_display_sequence=>10
,p_label=>'Edit'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.::P17_PRODUCT_ID:&PRODUCT_ID.'
,p_button_display_type=>'TEXT_WITH_ICON'
,p_icon_css_classes=>'fa-cart-edit'
,p_is_hot=>false
);
end;
/
prompt --application/end_environment
begin
wwv_flow_imp.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false)
);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
