// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module topk_sort_topk_sort_Pipeline_VITIS_LOOP_70_6 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        ostrm_TREADY,
        arr_300,
        arr_301,
        arr_302,
        arr_303,
        arr_304,
        arr_305,
        arr_306,
        arr_307,
        arr_308,
        arr_309,
        arr_310,
        arr_311,
        arr_312,
        arr_313,
        arr_314,
        arr_315,
        arr_316,
        arr_317,
        arr_318,
        arr_319,
        arr_320,
        arr_321,
        arr_322,
        arr_323,
        arr_324,
        arr_325,
        arr_326,
        arr_327,
        arr_328,
        arr_329,
        arr_330,
        arr_331,
        arr_332,
        arr_333,
        arr_334,
        arr_335,
        arr_336,
        arr_337,
        arr_338,
        arr_339,
        arr_340,
        arr_341,
        arr_342,
        arr_343,
        arr_344,
        arr_345,
        arr_346,
        arr_347,
        arr_348,
        arr_349,
        arr_350,
        arr_351,
        arr_352,
        arr_353,
        arr_354,
        arr_355,
        arr_356,
        arr_357,
        arr_358,
        arr_359,
        arr_360,
        arr_361,
        arr_362,
        arr_363,
        arr_364,
        arr_365,
        arr_366,
        arr_367,
        arr_368,
        arr_369,
        arr_370,
        arr_371,
        arr_372,
        arr_373,
        arr_374,
        arr_375,
        arr_376,
        arr_377,
        arr_378,
        arr_379,
        arr_380,
        arr_381,
        arr_382,
        arr_383,
        arr_384,
        arr_385,
        arr_386,
        arr_387,
        arr_388,
        arr_389,
        arr_390,
        arr_391,
        arr_392,
        arr_393,
        arr_394,
        arr_395,
        arr_396,
        arr_397,
        arr_398,
        arr_399,
        ostrm_TDATA,
        ostrm_TVALID,
        ostrm_TKEEP,
        ostrm_TSTRB,
        ostrm_TLAST
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input   ostrm_TREADY;
input  [31:0] arr_300;
input  [31:0] arr_301;
input  [31:0] arr_302;
input  [31:0] arr_303;
input  [31:0] arr_304;
input  [31:0] arr_305;
input  [31:0] arr_306;
input  [31:0] arr_307;
input  [31:0] arr_308;
input  [31:0] arr_309;
input  [31:0] arr_310;
input  [31:0] arr_311;
input  [31:0] arr_312;
input  [31:0] arr_313;
input  [31:0] arr_314;
input  [31:0] arr_315;
input  [31:0] arr_316;
input  [31:0] arr_317;
input  [31:0] arr_318;
input  [31:0] arr_319;
input  [31:0] arr_320;
input  [31:0] arr_321;
input  [31:0] arr_322;
input  [31:0] arr_323;
input  [31:0] arr_324;
input  [31:0] arr_325;
input  [31:0] arr_326;
input  [31:0] arr_327;
input  [31:0] arr_328;
input  [31:0] arr_329;
input  [31:0] arr_330;
input  [31:0] arr_331;
input  [31:0] arr_332;
input  [31:0] arr_333;
input  [31:0] arr_334;
input  [31:0] arr_335;
input  [31:0] arr_336;
input  [31:0] arr_337;
input  [31:0] arr_338;
input  [31:0] arr_339;
input  [31:0] arr_340;
input  [31:0] arr_341;
input  [31:0] arr_342;
input  [31:0] arr_343;
input  [31:0] arr_344;
input  [31:0] arr_345;
input  [31:0] arr_346;
input  [31:0] arr_347;
input  [31:0] arr_348;
input  [31:0] arr_349;
input  [31:0] arr_350;
input  [31:0] arr_351;
input  [31:0] arr_352;
input  [31:0] arr_353;
input  [31:0] arr_354;
input  [31:0] arr_355;
input  [31:0] arr_356;
input  [31:0] arr_357;
input  [31:0] arr_358;
input  [31:0] arr_359;
input  [31:0] arr_360;
input  [31:0] arr_361;
input  [31:0] arr_362;
input  [31:0] arr_363;
input  [31:0] arr_364;
input  [31:0] arr_365;
input  [31:0] arr_366;
input  [31:0] arr_367;
input  [31:0] arr_368;
input  [31:0] arr_369;
input  [31:0] arr_370;
input  [31:0] arr_371;
input  [31:0] arr_372;
input  [31:0] arr_373;
input  [31:0] arr_374;
input  [31:0] arr_375;
input  [31:0] arr_376;
input  [31:0] arr_377;
input  [31:0] arr_378;
input  [31:0] arr_379;
input  [31:0] arr_380;
input  [31:0] arr_381;
input  [31:0] arr_382;
input  [31:0] arr_383;
input  [31:0] arr_384;
input  [31:0] arr_385;
input  [31:0] arr_386;
input  [31:0] arr_387;
input  [31:0] arr_388;
input  [31:0] arr_389;
input  [31:0] arr_390;
input  [31:0] arr_391;
input  [31:0] arr_392;
input  [31:0] arr_393;
input  [31:0] arr_394;
input  [31:0] arr_395;
input  [31:0] arr_396;
input  [31:0] arr_397;
input  [31:0] arr_398;
input  [31:0] arr_399;
output  [31:0] ostrm_TDATA;
output   ostrm_TVALID;
output  [3:0] ostrm_TKEEP;
output  [3:0] ostrm_TSTRB;
output  [0:0] ostrm_TLAST;

reg ap_idle;
reg ostrm_TVALID;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
reg    ap_block_state2_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln70_fu_878_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    ostrm_TDATA_blk_n;
wire    ap_block_pp0_stage0;
wire   [31:0] pix_data_V_fu_890_p102;
reg   [31:0] pix_data_V_reg_1117;
reg    ap_block_pp0_stage0_11001;
wire   [0:0] pix_last_V_fu_1096_p2;
reg   [0:0] pix_last_V_reg_1122;
reg   [6:0] i_fu_248;
wire   [6:0] add_ln70_fu_884_p2;
wire    ap_loop_init;
reg   [6:0] ap_sig_allocacmp_i_1;
reg    ap_block_pp0_stage0_01001;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_done_reg = 1'b0;
end

topk_sort_mux_1007_32_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .din2_WIDTH( 32 ),
    .din3_WIDTH( 32 ),
    .din4_WIDTH( 32 ),
    .din5_WIDTH( 32 ),
    .din6_WIDTH( 32 ),
    .din7_WIDTH( 32 ),
    .din8_WIDTH( 32 ),
    .din9_WIDTH( 32 ),
    .din10_WIDTH( 32 ),
    .din11_WIDTH( 32 ),
    .din12_WIDTH( 32 ),
    .din13_WIDTH( 32 ),
    .din14_WIDTH( 32 ),
    .din15_WIDTH( 32 ),
    .din16_WIDTH( 32 ),
    .din17_WIDTH( 32 ),
    .din18_WIDTH( 32 ),
    .din19_WIDTH( 32 ),
    .din20_WIDTH( 32 ),
    .din21_WIDTH( 32 ),
    .din22_WIDTH( 32 ),
    .din23_WIDTH( 32 ),
    .din24_WIDTH( 32 ),
    .din25_WIDTH( 32 ),
    .din26_WIDTH( 32 ),
    .din27_WIDTH( 32 ),
    .din28_WIDTH( 32 ),
    .din29_WIDTH( 32 ),
    .din30_WIDTH( 32 ),
    .din31_WIDTH( 32 ),
    .din32_WIDTH( 32 ),
    .din33_WIDTH( 32 ),
    .din34_WIDTH( 32 ),
    .din35_WIDTH( 32 ),
    .din36_WIDTH( 32 ),
    .din37_WIDTH( 32 ),
    .din38_WIDTH( 32 ),
    .din39_WIDTH( 32 ),
    .din40_WIDTH( 32 ),
    .din41_WIDTH( 32 ),
    .din42_WIDTH( 32 ),
    .din43_WIDTH( 32 ),
    .din44_WIDTH( 32 ),
    .din45_WIDTH( 32 ),
    .din46_WIDTH( 32 ),
    .din47_WIDTH( 32 ),
    .din48_WIDTH( 32 ),
    .din49_WIDTH( 32 ),
    .din50_WIDTH( 32 ),
    .din51_WIDTH( 32 ),
    .din52_WIDTH( 32 ),
    .din53_WIDTH( 32 ),
    .din54_WIDTH( 32 ),
    .din55_WIDTH( 32 ),
    .din56_WIDTH( 32 ),
    .din57_WIDTH( 32 ),
    .din58_WIDTH( 32 ),
    .din59_WIDTH( 32 ),
    .din60_WIDTH( 32 ),
    .din61_WIDTH( 32 ),
    .din62_WIDTH( 32 ),
    .din63_WIDTH( 32 ),
    .din64_WIDTH( 32 ),
    .din65_WIDTH( 32 ),
    .din66_WIDTH( 32 ),
    .din67_WIDTH( 32 ),
    .din68_WIDTH( 32 ),
    .din69_WIDTH( 32 ),
    .din70_WIDTH( 32 ),
    .din71_WIDTH( 32 ),
    .din72_WIDTH( 32 ),
    .din73_WIDTH( 32 ),
    .din74_WIDTH( 32 ),
    .din75_WIDTH( 32 ),
    .din76_WIDTH( 32 ),
    .din77_WIDTH( 32 ),
    .din78_WIDTH( 32 ),
    .din79_WIDTH( 32 ),
    .din80_WIDTH( 32 ),
    .din81_WIDTH( 32 ),
    .din82_WIDTH( 32 ),
    .din83_WIDTH( 32 ),
    .din84_WIDTH( 32 ),
    .din85_WIDTH( 32 ),
    .din86_WIDTH( 32 ),
    .din87_WIDTH( 32 ),
    .din88_WIDTH( 32 ),
    .din89_WIDTH( 32 ),
    .din90_WIDTH( 32 ),
    .din91_WIDTH( 32 ),
    .din92_WIDTH( 32 ),
    .din93_WIDTH( 32 ),
    .din94_WIDTH( 32 ),
    .din95_WIDTH( 32 ),
    .din96_WIDTH( 32 ),
    .din97_WIDTH( 32 ),
    .din98_WIDTH( 32 ),
    .din99_WIDTH( 32 ),
    .din100_WIDTH( 7 ),
    .dout_WIDTH( 32 ))
mux_1007_32_1_1_U610(
    .din0(arr_300),
    .din1(arr_301),
    .din2(arr_302),
    .din3(arr_303),
    .din4(arr_304),
    .din5(arr_305),
    .din6(arr_306),
    .din7(arr_307),
    .din8(arr_308),
    .din9(arr_309),
    .din10(arr_310),
    .din11(arr_311),
    .din12(arr_312),
    .din13(arr_313),
    .din14(arr_314),
    .din15(arr_315),
    .din16(arr_316),
    .din17(arr_317),
    .din18(arr_318),
    .din19(arr_319),
    .din20(arr_320),
    .din21(arr_321),
    .din22(arr_322),
    .din23(arr_323),
    .din24(arr_324),
    .din25(arr_325),
    .din26(arr_326),
    .din27(arr_327),
    .din28(arr_328),
    .din29(arr_329),
    .din30(arr_330),
    .din31(arr_331),
    .din32(arr_332),
    .din33(arr_333),
    .din34(arr_334),
    .din35(arr_335),
    .din36(arr_336),
    .din37(arr_337),
    .din38(arr_338),
    .din39(arr_339),
    .din40(arr_340),
    .din41(arr_341),
    .din42(arr_342),
    .din43(arr_343),
    .din44(arr_344),
    .din45(arr_345),
    .din46(arr_346),
    .din47(arr_347),
    .din48(arr_348),
    .din49(arr_349),
    .din50(arr_350),
    .din51(arr_351),
    .din52(arr_352),
    .din53(arr_353),
    .din54(arr_354),
    .din55(arr_355),
    .din56(arr_356),
    .din57(arr_357),
    .din58(arr_358),
    .din59(arr_359),
    .din60(arr_360),
    .din61(arr_361),
    .din62(arr_362),
    .din63(arr_363),
    .din64(arr_364),
    .din65(arr_365),
    .din66(arr_366),
    .din67(arr_367),
    .din68(arr_368),
    .din69(arr_369),
    .din70(arr_370),
    .din71(arr_371),
    .din72(arr_372),
    .din73(arr_373),
    .din74(arr_374),
    .din75(arr_375),
    .din76(arr_376),
    .din77(arr_377),
    .din78(arr_378),
    .din79(arr_379),
    .din80(arr_380),
    .din81(arr_381),
    .din82(arr_382),
    .din83(arr_383),
    .din84(arr_384),
    .din85(arr_385),
    .din86(arr_386),
    .din87(arr_387),
    .din88(arr_388),
    .din89(arr_389),
    .din90(arr_390),
    .din91(arr_391),
    .din92(arr_392),
    .din93(arr_393),
    .din94(arr_394),
    .din95(arr_395),
    .din96(arr_396),
    .din97(arr_397),
    .din98(arr_398),
    .din99(arr_399),
    .din100(ap_sig_allocacmp_i_1),
    .dout(pix_data_V_fu_890_p102)
);

topk_sort_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage0),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter0_stage0)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln70_fu_878_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            i_fu_248 <= add_ln70_fu_884_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            i_fu_248 <= 7'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln70_fu_878_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        pix_data_V_reg_1117 <= pix_data_V_fu_890_p102;
        pix_last_V_reg_1122 <= pix_last_V_fu_1096_p2;
    end
end

always @ (*) begin
    if (((icmp_ln70_fu_878_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b0) & (ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_i_1 = 7'd0;
    end else begin
        ap_sig_allocacmp_i_1 = i_fu_248;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ostrm_TDATA_blk_n = ostrm_TREADY;
    end else begin
        ostrm_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ostrm_TVALID = 1'b1;
    end else begin
        ostrm_TVALID = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln70_fu_884_p2 = (ap_sig_allocacmp_i_1 + 7'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((ostrm_TREADY == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ostrm_TREADY == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ostrm_TREADY == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = (ostrm_TREADY == 1'b0);
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign icmp_ln70_fu_878_p2 = ((ap_sig_allocacmp_i_1 == 7'd100) ? 1'b1 : 1'b0);

assign ostrm_TDATA = pix_data_V_reg_1117;

assign ostrm_TKEEP = 4'd0;

assign ostrm_TLAST = pix_last_V_reg_1122;

assign ostrm_TSTRB = 4'd0;

assign pix_last_V_fu_1096_p2 = ((ap_sig_allocacmp_i_1 == 7'd99) ? 1'b1 : 1'b0);

endmodule //topk_sort_topk_sort_Pipeline_VITIS_LOOP_70_6