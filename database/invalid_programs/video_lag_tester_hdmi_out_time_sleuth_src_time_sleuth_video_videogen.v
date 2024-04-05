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

    reg [11:0] xpos;
    reg [11:0] ypos;
    reg [11:0] resolution_hpos;
    reg [11:0] lagdisplay_hpos1 /* synthesis syn_keep=1 */;
    reg [11:0] lagdisplay_hpos2 /* synthesis syn_keep=1 */;
    reg [11:0] lagdisplay_hpos3 /* synthesis syn_keep=1 */;
    reg [11:0] lagdisplay_hpos4;



    reg test_area;
    reg text_area1;
    reg text_area2;
    reg text_area3;
    reg text_area4;
    reg res_area;
    reg rpos;
    reg pos1;
    reg pos2;
    reg pos3;
    reg pos4;
    always @(posedge clock) begin
        xpos <= visible_counterX;
        ypos <= visible_counterY;


        test_area <= (displayFields && 
                   (xpos >= videoMode.h_field_start && xpos < videoMode.h_field_end && 
                   ((ypos >= videoMode.v_field1_start && ypos < videoMode.v_field1_end)
                 || (ypos >= videoMode.v_field2_start && ypos < videoMode.v_field2_end)
                 || (ypos >= videoMode.v_field3_start && ypos < videoMode.v_field3_end))));

         res_area <= (ypos < (12'd16 << videoMode.v_res_divider) 
                    && (xpos >> videoMode.h_res_divider) >= videoMode.h_res_start);

         text_area1 <= (ypos >= videoMode.v_lag_start
            && ypos < videoMode.v_lag_start + (12'd16 << videoMode.v_lag_divider)
            && (xpos >> videoMode.h_lag_divider) >= videoMode.h_lag_start
            && (xpos >> videoMode.h_lag_divider) < videoMode.h_lag_start + 80);
        
         text_area2 <= (ypos >= videoMode.v_lag_start + (12'd16 << videoMode.v_lag_divider)
            && ypos < videoMode.v_lag_start + (12'd32 << videoMode.v_lag_divider)
            && (xpos >> videoMode.h_lag_divider) >= videoMode.h_lag_start
            && (xpos >> videoMode.h_lag_divider) < videoMode.h_lag_start + 120);

          text_area3 <= (ypos >= videoMode.v_lag_start + (12'd32 << videoMode.v_lag_divider)
            && ypos < videoMode.v_lag_start + (12'd48 << videoMode.v_lag_divider)
            && (xpos >> videoMode.h_lag_divider) >= videoMode.h_lag_start
            && (xpos >> videoMode.h_lag_divider) < videoMode.h_lag_start + 192);

           text_area4 <=  (ypos >= videoMode.v_lag_start + (12'd48 << videoMode.v_lag_divider)
            && ypos < videoMode.v_lag_start + (12'd64 << videoMode.v_lag_divider)
            && (xpos >> videoMode.h_lag_divider) >= videoMode.h_lag_start
            && (xpos >> videoMode.h_lag_divider) < videoMode.h_lag_start + 120);

     resolution_hpos <= ((`RESLINE_SIZE - 1) - ((visible_counterX >> videoMode.h_res_divider) - videoMode.h_res_start));
     lagdisplay_hpos1 <= ((`LAGLINE_SIZE - 1) - ((visible_counterX >> videoMode.h_lag_divider) - videoMode.h_lag_start));
     lagdisplay_hpos2 <= ((`LAGLINE_SIZE - 1) - ((visible_counterX >> videoMode.h_lag_divider) - videoMode.h_lag_start))-80;
     lagdisplay_hpos3 <= ((`LAGLINE_SIZE - 1) - ((visible_counterX >> videoMode.h_lag_divider) - videoMode.h_lag_start))-200;
     lagdisplay_hpos4 <= ((`LAGLINE_SIZE - 1) - ((visible_counterX >> videoMode.h_lag_divider) - videoMode.h_lag_start))-392;
     rpos <= resolution_line[resolution_hpos];
     pos1 <= lagdisplay_line[lagdisplay_hpos1];
     pos2 <= lagdisplay_line[lagdisplay_hpos2];
     pos3 <= lagdisplay_line[lagdisplay_hpos3];
     pos4 <= lagdisplay_line[lagdisplay_hpos4];
        
    end

    always @(posedge clock) begin
        if (test_area)
        begin
            data <= 24'hFF_FF_FF;
        end else if (res_area)  begin // resolution info
            if (rpos) begin
                data <= 24'hFF_FF_FF;
            end else begin
                data <= 0;
            end
        end else if (text_area1)
        begin
            if (pos1) begin
                data <= 24'hFF_FF_FF;
            end else begin
                data <= 0;
            end
        end else if (text_area2) begin
            if (pos2) begin
                data <= 24'hFF_FF_FF;
            end else begin
                data <= 0;
            end
        end else if (text_area3) begin
            if (pos3) begin
                data <= 24'hFF_FF_FF;
            end else begin
                data <= 0;
            end
        end else if (text_area4) begin
            if (pos4) begin
                data <= 24'hFF_FF_FF;
            end else begin
                data <= 0;
            end
        end else begin
            data <= 0;
        end
    end
    
endmodule