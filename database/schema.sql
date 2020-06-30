CREATE TABLE cccontactlink(
	ContactNo int NOT NULL,
	LinkType varchar(40) NOT NULL,
	GFAreaNo int NULL,
	GFSectionNo int NULL,
	GFSubjectNo int NULL,
	RVACRef varchar(16) NULL,
	RVPropRef varchar(16) NULL,
	RVStatus char(1) NULL,
	RefContact int NULL,
	LinkNo int NOT NULL,
	RefContactType varchar(10) NULL,
	BenPersonReference numeric(9, 0) NULL,
	BenClaimReference varchar(16) NULL,
	BenContactNo numeric(9, 0) NULL,
	BenContactType varchar(2) NULL,
	BenClaimNo int NULL,
	Relationship varchar(50) NULL,
	UPMFldrNo int NULL,
	UHMTenant Varchar(50) NULL,
	uh_sid char(50) NULL,
	Tenant char(20) NULL,
	Applicant int NULL,
	Enquiry int NULL,
	GFLevel varchar(20) NULL,
	GFReference int NULL,
	UPMAreaID int NULL,
	UPMClientID int NULL,
	UPMCompanyID int NULL,
	UPMFolderID int NULL,
	UPMPayLocationID int NULL,
	UPMPayrollID int NULL,
	UPMPayrollMemberID int NULL,
	UPMPersonID int NULL,
	UPMSchemeID int NULL,
	CTAccountNo int NULL,
	NNDRAccountNo int NULL,
	UPMSystemID int NULL,
	UPMProjectID int NULL,
	Key1 char(20) NULL,
	Key2 char(10) NULL,
	source char(10) NULL,
	MODDATE Timestamp(3) NULL,
	MODUSER varchar(20) NULL,
	MODTYPE varchar(1) NOT NULL
);


CREATE TABLE CCEmailAddress(
	ContactNo int NOT NULL,
	Email varchar(50) NOT NULL,
	EmailType varchar(8) NOT NULL,
	OKToEmail varchar NOT NULL DEFAULT '0CDE',
	Defualt varchar(5) NOT NULL DEFAULT 'reg',
	EmailID int NOT NULL,
	modDate Timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	modUser varchar(20) NOT NULL DEFAULT 'was',
	modType char NOT NULL DEFAULT '0ABC',
	modProc int NULL,
	CONSTRAINT PK_emailAddress PRIMARY KEY (EmailID)
);


CREATE TABLE CCPHONE(
	contactno int NOT NULL,
	phoneno varchar NOT NULL,
	phonetype varchar NULL,
	oktocall varchar NULL,
	phoneid int NOT NULL,
	moddate Timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	moduser varchar NOT NULL DEFAULT '0abc',
	modtype char NOT NULL DEFAULT '0',
	modproc int NULL,
	CONSTRAINT PK_phone PRIMARY KEY (phoneid)
);


CREATE TABLE member(
	house_ref varchar(10) NOT NULL,
	person_no int NOT NULL,
	ethnic_origin char(3) NULL,
	gender char(1) NULL,
	title char(10) NULL,
	initials char(3) NULL,
	forename varchar(24) NULL,
	surname varchar(20) NULL,
	age numeric(3, 0) NULL,
	oap Boolean NOT NULL DEFAULT false,
	relationship char(1) NULL,
	econ_status char(1) NULL,
	responsible Boolean NOT NULL DEFAULT false,
	wheelch_user char(3) NULL,
	disabled char(3) NULL,
	cl_group_a char(3) NULL,
	cl_group_b char(3) NULL,
	ethnic_colour char(3) NULL,
	at_risk Boolean NOT NULL DEFAULT false,
	ni_no char(12) NULL,
	full_ed Boolean NOT NULL DEFAULT false,
	member_sid int NOT NULL DEFAULT 0,
	contacts_sid int NULL,
	tstamp Bytea NULL,
	comp_avail char(200) NULL,
	comp_display char(200) NULL,
	occupation char(3) NULL,
	asboissued Boolean NULL,
	liablemember Boolean NULL,
	dob Timestamp NOT NULL,
	nationality char(3) NULL,
	ci_surname varchar(255) NULL,
	u_pin_number char(20) NULL,
	ci_title char(10) NULL,
	ci_forename char(24) NULL,
	u_ethnic_other char(20) NULL,
	tenportactcode Char(36) NULL,
	transgender varchar(3) NULL,
	sex_orient varchar(3) NULL,
	religion_belief varchar(3) NULL,
	marriage_civil varchar(3) NULL,
	first_lang varchar(3) NULL,
	soc_ec_stat varchar(3) NULL,
	soc_class varchar(3) NULL,
	appearance varchar(3) NULL,
	vulnerable varchar(3) NULL,
	hiv_positive varchar(3) NULL,
	crim_rec varchar(3) NULL,
	contact_type varchar(3) NULL,
	corr_type varchar(3) NULL,
	resp_dep varchar(3) NULL,
	pregnant Boolean NULL,
	bank_acc_type char(3) NOT NULL DEFAULT '0ab',
	homeless varchar(3) NULL,
	CONSTRAINT PK_member PRIMARY KEY (person_no, house_ref)
);


CREATE TABLE property(
	prop_ref varchar(12) NOT NULL,
	level_code char(1) NULL,
	major_ref char(12) NULL,
	man_scheme char(11) NULL,
	post_code char(10) NULL,
	post_desig char(60) NULL,
	short_address char(200) NULL,
	telephone char(21) NULL,
	managed_property Boolean NOT NULL DEFAULT false,
	ownership char(10) NOT NULL DEFAULT '01234',
	agent char(3) NULL,
	comments text NULL,
	housing_officer char(3) NULL,
	area_office char(3) NULL,
	subtyp_code char(3) NULL,
	condition_code char(1) NULL,
	warden_ref char(6) NULL,
	la_ref char(3) NULL,
	water_ref char(12) NULL,
	scheme_ref char(20) NULL,
	insur_policy char(20) NULL,
	letable Boolean NOT NULL DEFAULT false,
	practical_completion Timestamp NULL,
	handover Timestamp(0) NULL,
	cat_type char(3) NULL,
	lounge Boolean NOT NULL DEFAULT false,
	laundry Boolean NOT NULL DEFAULT false,
	visitor_bed Boolean NOT NULL DEFAULT false,
	store Boolean NOT NULL DEFAULT false,
	warden_flat Boolean NOT NULL DEFAULT false,
	sheltered Boolean NOT NULL DEFAULT false,
	house_ref varchar(10) NOT NULL,
	occ_stat char(3) NULL,
	cyclical_due int NULL,
	shower Boolean NOT NULL DEFAULT false,
	heating char(3) NULL,
	rep_area char(3) NULL,
	ac_meth char(3) NULL,
	propsize char(3) NULL,
	rtb Boolean NOT NULL DEFAULT false,
	ratevalue int NULL,
	post_preamble char(60) NULL,
	core_shared Boolean NOT NULL DEFAULT false,
	rep_officer char(3) NULL,
	ins_value int NULL,
	u_nom2 char(10) NULL,
	region char(3) NULL,
	asbestos Boolean NOT NULL DEFAULT false,
	accomfund numeric(9, 2) NULL,
	candsfund numeric(9, 2) NULL,
	property_sid int NULL,
	keys int NULL,
	company char(11) NULL,
	lett_area char(3) NULL,
	rtb_application Boolean NULL,
	no_maint Boolean NULL,
	maintresp char(3) NULL,
	leasehold Boolean NULL,
	s125 Boolean NULL,
	planned_repair_area char(3) NULL,
	lra_ref char(10) NULL,
	co_code char(3) NULL,
	rep_subarea char(6) NULL,
	con_key int NULL,
	walk_no int NULL,
	walk_sequence int NULL,
	tstamp Bytea NULL,
	alinefull text NULL,
	arr_patch char(3) NULL,
	arr_officer char(3) NULL,
	dh_status char(3) NULL,
	dh_assdate Timestamp(0) NULL,
	dh_yearfail int NULL,
	dh_costnow int NULL,
	dh_costatfail int NULL,
	sap_rating int NULL,
	nher_rating numeric(10, 2) NULL,
	num_bedrooms int NULL,
	comm_lifts Boolean NULL,
	ent_level char(3) NULL,
	int_floors int NULL,
	garden_type char(3) NULL,
	pets_allowed Boolean NULL,
	parking char(3) NULL,
	minage_restric int NULL,
	family_size int NULL,
	child_allowed Boolean NULL,
	local_conn Boolean NULL,
	alloc_panel Boolean NULL,
	num_steps int NULL,
	garage Boolean NULL,
	maxage_restric int NULL,
	stair_lift Boolean NULL,
	through_lift Boolean NULL,
	acc_shower Boolean NULL,
	ramp Boolean NULL,
	hand_rails Boolean NULL,
	dining_room Boolean NULL,
	kitchen_dining Boolean NULL,
	sec_toileta Boolean NULL,
	sec_toiletb char(3) NULL,
	cooking_fuel char(3) NULL,
	comp_avail char(200) NULL,
	comp_display char(200) NULL,
	no_single_beds smallint NOT NULL DEFAULT 3,
	no_double_beds smallint NOT NULL DEFAULT 2,
	online_repairs Boolean NOT NULL DEFAULT false,
	vm_propref char(16) NULL,
	voidman_live Boolean NULL,
	repairable Boolean NOT NULL DEFAULT false,
	address1 char(255) NULL,
	u_prop_zone char(3) NULL,
	u_surveyor_patch char(3) NULL,
	u_estate char(16) NULL,
	u_block char(16) NULL,
	u_location char(16) NULL,
	u_rent_account char(12) NULL,
	u_floors int NULL,
	u_living_rooms char(1) NULL,
	u_access char(3) NULL,
	u_amarchetype char(16) NULL,
	u_priority_estate Boolean NULL,
	u_comm_entry char(50) NULL,
	u_consult_stat char(3) NULL,
	u_corr_width char(3) NULL,
	u_dpa_service char(3) NULL,
	u_est_quality char(3) NULL,
	u_est_security char(3) NULL,
	u_ext_decent char(3) NULL,
	u_gas_comments char(3) NULL,
	u_gas_service_req Boolean NULL,
	u_int_decent char(3) NULL,
	u_lever_taps char(3) NULL,
	u_lift_manufact char(3) NULL,
	u_rtb_start Timestamp NULL,
	u_sold_leased char(3) NULL,
	u_sold_leased_date Timestamp NULL,
	u_disabled_only Boolean NULL,
	u_date_disposed_due Timestamp NULL,
	u_leased_from char(3) NULL,
	u_lease_end_date Timestamp NULL,
	u_estate_management char(3) NULL,
	u_access_floor char(3) NULL,
	u_lift_available Boolean NULL,
	u_block_floors char(3) NULL,
	u_balcony Boolean NULL,
	u_door_entry Boolean NULL,
	u_council_property Boolean NULL,
	u_oap_only Boolean NULL,
	u_disabled_occupier Boolean NULL,
	u_estate_map_ref char(16) NULL,
	u_plan_type char(3) NULL,
	u_year_constructed int NULL,
	u_collection_round char(3) NULL,
	u_temporary_accom char(10) NULL,
	u_window_type char(3) NULL,
	u_quality_index char(10) NULL,
	u_asbestos_item char(10) NULL,
	u_disposed_type char(3) NULL,
	u_rent_subzone char(3) NULL,
	u_legal_cases char(10) NULL,
	u_asbestos_date Timestamp NULL,
	u_llpg_ref char(16) NULL,
	u_lift_type char(3) NULL,
	u_ghost_block Boolean NULL,
	u_ghost_address char(50) NULL,
	u_prop_area_loc char(16) NULL,
	u_old_finance_code char(10) NULL,
	u_ha_property Boolean NULL,
	u_mobility_std char(3) NULL,
	u_mobility_wchair char(3) NULL,
	u_no_lifts char(3) NULL,
	u_northing char(12) NULL,
	u_overall_decent char(3) NULL,
	u_prop_sort_key char(3) NULL,
	u_raised_sockets Boolean NULL,
	u_ramped_access Boolean NULL,
	u_stair_lift Boolean NULL,
	u_wchair_std char(3) NULL,
	u_kitchenunit Boolean NULL,
	u_reasondisposed char(3) NULL,
	u_mraarchetype char(20) NULL,
	u_assetarchetype char(20) NULL,
	u_hraarchetype char(20) NULL,
	u_lsvtarchetype char(20) NULL,
	u_beaconcodes char(15) NULL,
	u_llpgref char(12) NULL,
	u_alarm Boolean NULL,
	u_cat_type char(3) NULL,
	u_ceiling_hoist char(3) NULL,
	u_disabled_extend char(3) NULL,
	u_dh_ext_prog char(50) NULL,
	u_dh_int_prog char(50) NULL,
	u_int_balcony char(3) NULL,
	u_wchair_int_access char(3) NULL,
	u_lowered_switches char(3) NULL,
	u_raised_socket char(3) NULL,
	u_front_ramp char(3) NULL,
	u_rear_ramp char(3) NULL,
	u_scooter_store char(3) NULL,
	u_stair_lift_type char(3) NULL,
	u_hand_rail_type char(3) NULL,
	u_rear_ent_steps int NULL,
	u_through_lift char(3) NULL,
	u_no_wcs int NULL,
	u_wc_closomat char(3) NULL,
	u_widened_doors char(3) NULL,
	owner_conf char(3) NULL,
	epc_cert_no char(25) NULL,
	epc_cert_date Timestamp NULL,
	epc_surv_date Timestamp NULL,
	epc_rq_date Timestamp NULL,
	epc_rec_date Timestamp NULL,
	epc_energy numeric(3, 0) NULL,
	epc_co2 numeric(3, 0) NULL,
	sc_sinkfund numeric(8, 2) NULL,
	u_s20_factor numeric(8, 4) NULL,
	u_buy_back_date Timestamp NULL,
	u_shared_bathroom Boolean NULL,
	u_shared_toilet Boolean NULL,
	u_temp_tenure char(3) NULL,
	u_disrepair Boolean NULL,
	u_lha_area char(3) NULL,
	u_est_man char(50) NULL,
	u_cleaner char(50) NULL,
	u_ahr_cat char(3) NULL,
	u_shared_kitchen Boolean NULL,
	u_rsl_prop_ref char(16) NULL,
	u_uses_com_boiler Boolean NULL,
	u_uses_door_ent Boolean NULL,
	u_uses_lift Boolean NULL,
	u_mw_patch char(3) NULL,
	u_year_built char(4) NULL,
	u_hand_back_date Timestamp NULL,
	u_bedroom_bedsize char(3) NULL,
	u_mkt_info_online char(1000) NULL,
	u_mkt_info_magazine char(1000) NULL,
	dtstamp Timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	u_hgas int NULL,
	u_access_type char(3) NULL,
	u_storage_space char(3) NULL,
	u_internal_steps int NULL,
	u_external_steps int NULL,
	u_hoists Boolean NULL,
	u_intercom Boolean NULL,
	u_adapted_kitchen char(3) NULL,
	CONSTRAINT PK_property PRIMARY KEY (prop_ref)
);


CREATE TABLE tenagree(
	tag_ref char(11) NOT NULL,
	prop_ref char(12) NULL,
	house_ref char(10) NULL,
	tag_desc char(200) NULL,
	prd_sno int NULL,
	cot Timestamp(0) NULL,
	eot Timestamp(0) NULL,
	tenure char(3) NULL,
	prd_code char(2) NULL,
	spec_terms Boolean NOT NULL,
	other_accounts Boolean NOT NULL,
	active Boolean NOT NULL,
	present Boolean NOT NULL,
	terminated Boolean NOT NULL,
	free_active Boolean NOT NULL,
	nop Boolean NOT NULL,
	ra_date Timestamp(0) NULL,
	rentgrp_ref char(3) NULL,
	succession_date Timestamp(0) NULL,
	ori_rent numeric(9, 2) NULL,
	ori_service numeric(9, 2) NULL,
	rent numeric(9, 2) NULL,
	service numeric(9, 2) NULL,
	other_charge numeric(9, 2) NULL,
	differential numeric(9, 2) NULL,
	tenancy_rent numeric(9, 2) NULL,
	tenancy_service numeric(9, 2) NULL,
	tenancy_other numeric(9, 2) NULL,
	cur_bal numeric(9, 2) NULL,
	cur_nr_bal numeric(9, 2) NULL,
	additional_debit Boolean NOT NULL,
	occ_status char(3) NULL,
	master_tag char(11) NULL,
	prdno_on_vac int NULL,
	year_on_vac int NULL,
	occ_phase int NULL,
	hb_expire Timestamp(0) NULL,
	ass_date Timestamp(0) NULL,
	fd_charge Boolean NOT NULL,
	hb_freq char(3) NULL,
	reason_term char(3) NULL,
	receiptcard Boolean NOT NULL,
	recgrossorder text NULL,
	lastgrosscol numeric(1, 0) NULL,
	lastreccol numeric(1, 0) NULL,
	lastrecline numeric(2, 0) NULL,
	cardbal numeric(9, 2) NULL,
	recstatus numeric(1, 0) NULL,
	curcardno numeric(3, 0) NULL,
	recgrosdate Timestamp(0) NULL,
	cur_action_set int NULL,
	cur_action_no int NULL,
	tag_action char(3) NULL,
	agr_type char(1) NULL,
	rech_tag_ref char(11) NULL,
	master_tag_ref char(11) NULL,
	sup_ref char(12) NULL,
	nosp Boolean NOT NULL,
	ntq Boolean NOT NULL,
	eviction Boolean NOT NULL,
	committee Boolean NOT NULL,
	suppossorder Boolean NOT NULL,
	possorder Boolean NOT NULL,
	courtapp Boolean NOT NULL,
	nospexpire Timestamp(0) NULL,
	courtdate Timestamp(0) NULL,
	ntqexpire Timestamp(0) NULL,
	visitdate Timestamp(0) NULL,
	tenure_ori char(3) NULL,
	occ_phase_ori int NULL,
	open_item Boolean NOT NULL,
	allocation_method char(3) NULL,
	man_scheme char(11) NULL,
	anal_method char(1) NULL,
	inv_type char(1) NULL,
	con_key int NULL,
	major_phase int NULL,
	forwardaddress text NULL,
	acc_type char(1) NULL,
	tenagree_sid int NULL,
	noticegiven Boolean NULL,
	potentialenddate Timestamp(0) NOT NULL,
	rtb_date Timestamp(0) NULL,
	rtb_issued_by char(30) NULL,
	rtb_year int NULL,
	rtb_work char(40) NULL,
	rtb_amount int NULL,
	rtb_project char(20) NULL,
	rtb_recharge numeric(11, 2) NULL,
	rtb_budget numeric(11, 2) NULL,
	last_action_date Timestamp(0) NULL,
	last_action char(3) NULL,
	high_action_date Timestamp(0) NULL,
	high_action char(3) NULL,
	last_balance numeric(10, 2) NULL,
	tag_action_date Timestamp(0) NULL,
	ent_act_status char(3) NULL,
	monitoring char(1) NULL,
	monit_date Timestamp(0) NULL,
	monit_prd_type char(1) NULL,
	next_monit_date Timestamp(0) NULL,
	process_group_id int NULL,
	arrears_case Boolean NULL,
	cur_araction_sid int NULL,
	pmandata text NULL,
	cur_action_subno int NULL,
	collect_cash Boolean NULL,
	tstamp Bytea NULL,
	evictdate Timestamp(0) NULL,
	lettertext text NULL,
	core_ver char(10) NULL,
	w2propactiondate Timestamp(0) NULL,
	rtb_effective Timestamp(0) NULL,
	rtb_term Timestamp(0) NULL,
	s125_issued Boolean NULL,
	comp_avail char(200) NULL,
	comp_display char(200) NULL,
	revdatann char(3) NULL,
	phased Boolean NULL,
	ten_b_forward numeric(10, 2) NULL,
	vm_propref char(16) NULL,
	noticegiven_dt Timestamp(0) NULL,
	keysrecd_dt Timestamp(0) NULL,
	u_rent_round char(3) NULL,
	u_rent_patch char(3) NULL,
	u_acc_closed_by char(3) NULL,
	u_rent_card_printed Timestamp(3) NULL,
	u_financial_group char(3) NULL,
	u_inhibit_statements Boolean NULL,
	u_inhibit_writeoffs Boolean NULL,
	u_oracle_hb_int Boolean NULL,
	u_message text NULL,
	u_nok_relationship char(3) NULL,
	u_account_type char(3) NULL,
	u_rent_zone char(3) NULL,
	u_rent_subzone char(3) NULL,
	u_letting_date Timestamp(3) NULL,
	u_comments text NULL,
	u_part_period_option Boolean NULL,
	u_intro_start_date Timestamp(3) NULL,
	u_intro_end_date Timestamp(3) NULL,
	u_sublet Boolean NULL,
	u_saff_rentacc char(20) NULL,
	u_saff_tenancy char(12) NULL,
	u_inform_hb Boolean NULL,
	u_sublet_end Timestamp(0) NULL,
	u_notice_served Timestamp(0) NULL,
	u_notice_effective Timestamp(0) NULL,
	u_bal_dispute numeric(10, 2) NULL,
	u_money_judgement numeric(10, 2) NULL,
	u_referred_legal numeric(10, 2) NULL,
	u_mw_payment_due Timestamp(0) NULL,
	u_periods_in_arrears numeric(4, 0) NULL,
	u_complaint_active Boolean NULL,
	u_pay_by_book Boolean NULL,
	u_new_book Boolean NULL,
	u_charging_order numeric(10, 2) NULL,
	u_notice_type char(3) NULL,
	u_court_outcome char(3) NULL,
	u_notice_expiry Timestamp(0) NULL,
	u_saff_auto Boolean NULL,
	u_nom2 char(10) NULL,
	u_payment_expected char(3) NOT NULL,
	u_ignore_arr_policy Boolean NULL,
	dtstamp Timestamp(0) NOT NULL,
	intro_date Timestamp(0) NOT NULL,
	intro_ext_date Timestamp(0) NOT NULL,
	tenpay_freq char(3) NULL,
	tenpay_start Timestamp(0) NULL,
	u_dwp_direct_payment Boolean NULL,
	u_uc_case Boolean NULL,
	u_uc_direct_payment Boolean NULL,
	u_under_occ_reduct Boolean NULL,
	u_mutual_ex Boolean NULL,
	u_uc_start_date Timestamp(0) NULL,
	u_uc_bal_at_start numeric(10, 2) NULL
);
