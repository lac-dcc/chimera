`include "../defines.v"

module videogen(
    input clock,
    input VideoMode videoMode,
    input [11:0] counterX,
    input [11:0] counterY,
    input [11:0] visible_counterX,
    input [11:0] visible_counterY,
    input [`RESLINE_SIZE-1:0] resolution_line,
    input [`LAGLINE_SIZE-1:0] lagdisplay_line,
    input state,
    output reg starttrigger,
    output reg [23:0] data
);
    reg [5:0] frameCounter = 0;
    reg displayFields = 0;
    reg [2:0] metaCounter = 0;

    /* frame counter */
    always @(posedge clock) begin
        if (counterX == videoMode.h_sync + videoMode.h_back_porch
         && counterY == videoMode.v_sync + (state ? videoMode.v_back_porch_2 : videoMode.v_back_porch_1)) begin
            if (frameCounter < `FRAME_COUNTER - 1 + metaCounter) begin
                frameCounter <= frameCounter + 1'b1;
            end else begin
                frameCounter <= 0;
            end

            if (frameCounter == 0) begin
                starttrigger <= 1;
                displayFields <= 1;
            end else if (frameCounter > `FRAME_ON_COUNT - 1) begin
                displayFields <= 0;
            end

            metaCounter <= metaCounter + 1'b1;
        end else begin
            starttrigger <= 0;
        end
    end

    always @(posedge clock) begin
        doOutputValue(
            .xpos(visible_counterX), 
            .ypos(visible_counterY),
            .resolution_hpos((`RESLINE_SIZE - 1) - ((visible_counterX >> videoMode.h_res_divider) - videoMode.h_res_start)),
            .lagdisplay_hpos((`LAGLINE_SIZE - 1) - ((visible_counterX >> videoMode.h_lag_divider) - videoMode.h_lag_start))
        );
    end

    task doOutputValue;
        input [11:0] xpos;
        input [11:0] ypos;
        input [11:0] resolution_hpos;
        input [11:0] lagdisplay_hpos;
        begin
            if (displayFields && 
                (xpos >= videoMode.h_field_start && xpos < videoMode.h_field_end && 
                   ((ypos >= videoMode.v_field1_start && ypos < videoMode.v_field1_end)
                 || (ypos >= videoMode.v_field2_start && ypos < videoMode.v_field2_end)
                 || (ypos >= videoMode.v_field3_start && ypos < videoMode.v_field3_end))))
            begin
                data <= 24'h_FF_FF_FF;
            end else if (
                    ypos < (12'd16 << videoMode.v_res_divider) 
                && (xpos >> videoMode.h_res_divider) >= videoMode.h_res_start
            ) begin // resolution info
                if (resolution_line[resolution_hpos]) begin
                    data <= 24'h_FF_FF_FF;
                end else begin
                    data <= 0;
                end
            end else if (
                   ypos >= videoMode.v_lag_start
                && ypos < videoMode.v_lag_start + (12'd16 << videoMode.v_lag_divider)
                && (xpos >> videoMode.h_lag_divider) >= videoMode.h_lag_start
                && (xpos >> videoMode.h_lag_divider) < videoMode.h_lag_start + 80
            ) begin
                if (lagdisplay_line[lagdisplay_hpos]) begin
                    data <= 24'h_FF_FF_FF;
                end else begin
                    data <= 0;
                end
            end else if (
                   ypos >= videoMode.v_lag_start + (12'd16 << videoMode.v_lag_divider)
                && ypos < videoMode.v_lag_start + (12'd32 << videoMode.v_lag_divider)
                && (xpos >> videoMode.h_lag_divider) >= videoMode.h_lag_start
                && (xpos >> videoMode.h_lag_divider) < videoMode.h_lag_start + 120
            ) begin
                if (lagdisplay_line[lagdisplay_hpos - 80]) begin
                    data <= 24'h_FF_FF_FF;
                end else begin
                    data <= 0;
                end
            end else if (
                   ypos >= videoMode.v_lag_start + (12'd32 << videoMode.v_lag_divider)
                && ypos < videoMode.v_lag_start + (12'd48 << videoMode.v_lag_divider)
                && (xpos >> videoMode.h_lag_divider) >= videoMode.h_lag_start
                && (xpos >> videoMode.h_lag_divider) < videoMode.h_lag_start + 192
            ) begin
                if (lagdisplay_line[lagdisplay_hpos - 200]) begin
                    data <= 24'h_FF_FF_FF;
                end else begin
                    data <= 0;
                end
            end else if (
                   ypos >= videoMode.v_lag_start + (12'd48 << videoMode.v_lag_divider)
                && ypos < videoMode.v_lag_start + (12'd64 << videoMode.v_lag_divider)
                && (xpos >> videoMode.h_lag_divider) >= videoMode.h_lag_start
                && (xpos >> videoMode.h_lag_divider) < videoMode.h_lag_start + 120
            ) begin
                if (lagdisplay_line[lagdisplay_hpos - 392]) begin
                    data <= 24'h_FF_FF_FF;
                end else begin
                    data <= 0;
                end
            end else begin
                data <= 0;
            end
        end
    endtask
endmodule