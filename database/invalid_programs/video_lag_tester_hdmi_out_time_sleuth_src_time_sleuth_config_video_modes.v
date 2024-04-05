
`include "defines.v"

const VideoMode VIDEO_MODE_480P = {
    `MODE_480p, // id
    12'd858,   // h_total
    12'd720,   // h_active
    12'd16,    // h_front_porch
    12'd62,    // h_sync
    12'd60,    // h_back_porch
    1'b0,      // h_sync_pol

    12'd480,   // v_active
    12'd9,     // v_front_porch
    12'd6,     // v_sync

    12'd525,   // v_total_1
    12'd30,    // v_back_porch_1
    12'd0,     // v_pxl_offset_1

    12'd525,   // v_total_2
    12'd30,    // v_back_porch_2
    12'd0,     // v_pxl_offset_2

    1'b0,      // v_sync_pol

    12'd40,    // h_field_start
    12'd200,   // h_field_end
    12'd0,     // v_field1_start
    12'd40,    // v_field1_end
    12'd220,   // v_field2_start
    12'd260,   // v_field2_end
    12'd440,   // v_field3_start
    12'd480,   // v_field3_end

    4'd0,      // h_res_divider
    4'd0,      // v_res_divider
    12'd720 - `RESLINE_SIZE,   // h_res_start

    4'd1,      // h_lag_divider
    4'd1,      // v_lag_divider
    12'd110,   // h_lag_start
    12'd50     // v_lag_start
};

const VideoMode VIDEO_MODE_480I = {
    `MODE_480i, // id
    12'd1716,  // h_total
    12'd1440,  // h_active
    12'd38,    // h_front_porch
    12'd124,   // h_sync
    12'd114,   // h_back_porch
    1'b0,      // h_sync_pol

    12'd240,   // v_active
    12'd4,     // v_front_porch
    12'd3,     // v_sync

    12'd262,   // v_total_1
    12'd15,    // v_back_porch_1
    12'd0,     // v_pxl_offset_1

    12'd263,   // v_total_2
    12'd16,    // v_back_porch_2
    12'd858,   // v_pxl_offset_2

    1'b0,      // v_sync_pol

    12'd80,    // h_field_start
    12'd400,   // h_field_end
    12'd0,     // v_field1_start
    12'd20,    // v_field1_end
    12'd110,   // v_field2_start
    12'd130,   // v_field2_end
    12'd220,   // v_field3_start
    12'd240,   // v_field3_end

    4'd1,      // h_res_divider
    4'd0,      // v_res_divider
    12'd720 - `RESLINE_SIZE,   // h_res_start

    4'd2,      // h_lag_divider
    4'd0,      // v_lag_divider
    12'd110,   // h_lag_start
    12'd25     // v_lag_start
};

const VideoMode VIDEO_MODE_720P = {
    `MODE_720p,  // id
    12'd1650,  // h_total
    12'd1280,  // h_active
    12'd110,   // h_front_porch
    12'd40,    // h_sync
    12'd220,   // h_back_porch
    1'b1,      // h_sync_pol

    12'd720,   // v_active
    12'd5,     // v_front_porch
    12'd5,     // v_sync

    12'd750,   // v_total_1
    12'd20,    // v_back_porch_1
    12'd0,     // v_pxl_offset_1

    12'd750,   // v_total_2
    12'd20,    // v_back_porch_2
    12'd0,     // v_pxl_offset_2

    1'b1,      // v_sync_pol

    12'd80,    // h_field_start
    12'd400,   // h_field_end
    12'd0,     // v_field1_start
    12'd60,    // v_field1_end
    12'd330,   // v_field2_start
    12'd390,   // v_field2_end
    12'd660,   // v_field3_start
    12'd720,   // v_field3_end

    4'd1,      // h_res_divider
    4'd1,      // v_res_divider
    12'd640 - `RESLINE_SIZE,   // h_res_start

    4'd2,      // h_lag_divider
    4'd2,      // v_lag_divider
    12'd110,   // h_lag_start
    12'd60     // v_lag_start
};

const VideoMode VIDEO_MODE_1080P = {
    `MODE_1080p, // id
    12'd1100,  // h_total
    12'd960,   // h_active
    12'd44,    // h_front_porch
    12'd22,    // h_sync
    12'd74,    // h_back_porch
    1'b1,      // h_sync_pol

    12'd1080,  // v_active
    12'd4,     // v_front_porch
    12'd5,     // v_sync

    12'd1125,  // v_total_1
    12'd36,    // v_back_porch_1
    12'd0,     // v_pxl_offset_1

    12'd1125,  // v_total_2
    12'd36,    // v_back_porch_2
    12'd0,     // v_pxl_offset_2

    1'b1,      // v_sync_pol

    12'd60,    // h_field_start
    12'd300,   // h_field_end
    12'd0,     // v_field1_start
    12'd90,    // v_field1_end
    12'd495,   // v_field2_start
    12'd585,   // v_field2_end
    12'd990,   // v_field3_start
    12'd1080,  // v_field3_end

    4'd0,      // h_res_divider
    4'd1,      // v_res_divider
    12'd960 - `RESLINE_SIZE,   // h_res_start

    4'd1,      // h_lag_divider
    4'd2,      // v_lag_divider
    12'd180,    // h_lag_start (px / 2)
    12'd120    // v_lag_start
};

const VideoMode VIDEO_MODE_1080I = {
    `MODE_1080i, // id
    12'd2200,  // h_total
    12'd1920,  // h_active
    12'd88,    // h_front_porch
    12'd44,    // h_sync
    12'd148,   // h_back_porch
    1'b1,      // h_sync_pol

    12'd540,   // v_active
    12'd2,     // v_front_porch
    12'd5,     // v_sync

    12'd562,   // v_total_1
    12'd15,    // v_back_porch_1
    12'd0,     // v_pxl_offset_1

    12'd563,   // v_total_2
    12'd16,    // v_back_porch_2
    12'd1100,  // v_pxl_offset_2

    1'b1,      // v_sync_pol

    12'd120,   // h_field_start
    12'd600,   // h_field_end
    12'd0,     // v_field1_start
    12'd45,    // v_field1_end
    12'd247,   // v_field2_start
    12'd292,   // v_field2_end
    12'd495,   // v_field3_start
    12'd540,  // v_field3_end

    4'd1,      // h_res_divider
    4'd0,      // v_res_divider
    12'd960 - `RESLINE_SIZE,   // h_res_start

    4'd2,      // h_lag_divider
    4'd1,      // v_lag_divider
    12'd180,    // h_lag_start (px / 2)
    12'd60    // v_lag_start
};
