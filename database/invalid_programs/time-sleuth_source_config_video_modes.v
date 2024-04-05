
`include "../defines.v"

const VideoMode VIDEO_MODE_480P = {
    `MODE_480p, // id
    12'd_858,   // h_total
    12'd_720,   // h_active
    12'd_16,    // h_front_porch
    12'd_62,    // h_sync
    12'd_60,    // h_back_porch
    1'b_0,      // h_sync_pol

    12'd_480,   // v_active
    12'd_9,     // v_front_porch
    12'd_6,     // v_sync

    12'd_525,   // v_total_1
    12'd_30,    // v_back_porch_1
    12'd_0,     // v_pxl_offset_1

    12'd_525,   // v_total_2
    12'd_30,    // v_back_porch_2
    12'd_0,     // v_pxl_offset_2

    1'b_0,      // v_sync_pol

    12'd_40,    // h_field_start
    12'd_200,   // h_field_end
    12'd_0,     // v_field1_start
    12'd_40,    // v_field1_end
    12'd_220,   // v_field2_start
    12'd_260,   // v_field2_end
    12'd_440,   // v_field3_start
    12'd_480,   // v_field3_end

    4'd_0,      // h_res_divider
    4'd_0,      // v_res_divider
    12'd_720 - `RESLINE_SIZE,   // h_res_start

    4'd_1,      // h_lag_divider
    4'd_1,      // v_lag_divider
    12'd_110,   // h_lag_start
    12'd_50     // v_lag_start
};

const VideoMode VIDEO_MODE_480I = {
    `MODE_480i, // id
    12'd_1716,  // h_total
    12'd_1440,  // h_active
    12'd_38,    // h_front_porch
    12'd_124,   // h_sync
    12'd_114,   // h_back_porch
    1'b_0,      // h_sync_pol

    12'd_240,   // v_active
    12'd_4,     // v_front_porch
    12'd_3,     // v_sync

    12'd_262,   // v_total_1
    12'd_15,    // v_back_porch_1
    12'd_0,     // v_pxl_offset_1

    12'd_263,   // v_total_2
    12'd_16,    // v_back_porch_2
    12'd_858,   // v_pxl_offset_2

    1'b_0,      // v_sync_pol

    12'd_80,    // h_field_start
    12'd_400,   // h_field_end
    12'd_0,     // v_field1_start
    12'd_20,    // v_field1_end
    12'd_110,   // v_field2_start
    12'd_130,   // v_field2_end
    12'd_220,   // v_field3_start
    12'd_240,   // v_field3_end

    4'd_1,      // h_res_divider
    4'd_0,      // v_res_divider
    12'd_720 - `RESLINE_SIZE,   // h_res_start

    4'd_2,      // h_lag_divider
    4'd_0,      // v_lag_divider
    12'd_110,   // h_lag_start
    12'd_25     // v_lag_start
};

const VideoMode VIDEO_MODE_720P = {
    `MODE_720p,  // id
    12'd_1650,  // h_total
    12'd_1280,  // h_active
    12'd_110,   // h_front_porch
    12'd_40,    // h_sync
    12'd_220,   // h_back_porch
    1'b_1,      // h_sync_pol

    12'd_720,   // v_active
    12'd_5,     // v_front_porch
    12'd_5,     // v_sync

    12'd_750,   // v_total_1
    12'd_20,    // v_back_porch_1
    12'd_0,     // v_pxl_offset_1

    12'd_750,   // v_total_2
    12'd_20,    // v_back_porch_2
    12'd_0,     // v_pxl_offset_2

    1'b_1,      // v_sync_pol

    12'd_80,    // h_field_start
    12'd_400,   // h_field_end
    12'd_0,     // v_field1_start
    12'd_60,    // v_field1_end
    12'd_330,   // v_field2_start
    12'd_390,   // v_field2_end
    12'd_660,   // v_field3_start
    12'd_720,   // v_field3_end

    4'd_1,      // h_res_divider
    4'd_1,      // v_res_divider
    12'd_640 - `RESLINE_SIZE,   // h_res_start

    4'd_2,      // h_lag_divider
    4'd_2,      // v_lag_divider
    12'd_110,   // h_lag_start
    12'd_60     // v_lag_start
};

const VideoMode VIDEO_MODE_1080P = {
    `MODE_1080p, // id
    12'd_1100,  // h_total
    12'd_960,   // h_active
    12'd_44,    // h_front_porch
    12'd_22,    // h_sync
    12'd_74,    // h_back_porch
    1'b_1,      // h_sync_pol

    12'd_1080,  // v_active
    12'd_4,     // v_front_porch
    12'd_5,     // v_sync

    12'd_1125,  // v_total_1
    12'd_36,    // v_back_porch_1
    12'd_0,     // v_pxl_offset_1

    12'd_1125,  // v_total_2
    12'd_36,    // v_back_porch_2
    12'd_0,     // v_pxl_offset_2

    1'b_1,      // v_sync_pol

    12'd_60,    // h_field_start
    12'd_300,   // h_field_end
    12'd_0,     // v_field1_start
    12'd_90,    // v_field1_end
    12'd_495,   // v_field2_start
    12'd_585,   // v_field2_end
    12'd_990,   // v_field3_start
    12'd_1080,  // v_field3_end

    4'd_0,      // h_res_divider
    4'd_1,      // v_res_divider
    12'd_960 - `RESLINE_SIZE,   // h_res_start

    4'd_1,      // h_lag_divider
    4'd_2,      // v_lag_divider
    12'd_180,    // h_lag_start (px / 2)
    12'd_120    // v_lag_start
};

const VideoMode VIDEO_MODE_1080I = {
    `MODE_1080i, // id
    12'd_2200,  // h_total
    12'd_1920,  // h_active
    12'd_88,    // h_front_porch
    12'd_44,    // h_sync
    12'd_148,   // h_back_porch
    1'b_1,      // h_sync_pol

    12'd_540,   // v_active
    12'd_2,     // v_front_porch
    12'd_5,     // v_sync

    12'd_562,   // v_total_1
    12'd_15,    // v_back_porch_1
    12'd_0,     // v_pxl_offset_1

    12'd_563,   // v_total_2
    12'd_16,    // v_back_porch_2
    12'd_1100,  // v_pxl_offset_2

    1'b_1,      // v_sync_pol

    12'd_120,   // h_field_start
    12'd_600,   // h_field_end
    12'd_0,     // v_field1_start
    12'd_45,    // v_field1_end
    12'd_247,   // v_field2_start
    12'd_292,   // v_field2_end
    12'd_495,   // v_field3_start
    12'd_540,  // v_field3_end

    4'd_1,      // h_res_divider
    4'd_0,      // v_res_divider
    12'd_960 - `RESLINE_SIZE,   // h_res_start

    4'd_2,      // h_lag_divider
    4'd_1,      // v_lag_divider
    12'd_180,    // h_lag_start (px / 2)
    12'd_60    // v_lag_start
};
