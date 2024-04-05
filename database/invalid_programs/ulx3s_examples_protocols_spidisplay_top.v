`default_nettype none

module top (
    input wire clk_25mhz,

    output wire oled_csn,
    output wire oled_clk,
    output wire oled_mosi,
    output wire oled_dc,
    output wire oled_resn,
    output wifi_gpio0,    
);
    wire [7:0] init_block[0:43];

    // NOP
    assign init_block[00] = 8'hBC;
    // Set display off
    assign init_block[01] = 8'hAE;
    // Set data format
    assign init_block[02] = 8'hA0; assign init_block[03] = 8'b00100010;
    // Set display start line
    assign init_block[04] = 8'hA1; assign init_block[05] = 8'h00;
    // Set display offset
    assign init_block[06] = 8'hA2; assign init_block[07] = 8'h00;
    // Set display mode normal
    assign init_block[08] = 8'hA4;
    // Set multiplex ratio
    assign init_block[09] = 8'hA8; assign init_block[10] = 8'b00111111;
    // Set master configuration
    assign init_block[11] = 8'hAD; assign init_block[12] = 8'b10001110;
    // Set power save mode
    assign init_block[13] = 8'hB0; assign init_block[14] = 8'h00;
    // Phase 1/2 period adjustment
    assign init_block[15] = 8'hB1; assign init_block[16] = 8'h74;
    // Set display clock divider
    assign init_block[17] = 8'hF0; assign init_block[18] = 8'hF0;
    // Set precharge A
    assign init_block[19] = 8'h8A; assign init_block[20] = 8'h64;
    // Set precharge B
    assign init_block[21] = 8'h8B; assign init_block[22] = 8'h78;
    // Set precharge C
    assign init_block[23] = 8'h8C; assign init_block[24] = 8'h64;
    // Set precharge voltage
    assign init_block[25] = 8'hBB; assign init_block[26] = 8'h31;
    // Set contrast A
    assign init_block[27] = 8'h81; assign init_block[28] = 8'hFF;
    // Set contrast B
    assign init_block[29] = 8'h82; assign init_block[30] = 8'hFF;
    // Set contrast C
    assign init_block[31] = 8'h83; assign init_block[32] = 8'hFF;
    // Set Vcomh voltage
    assign init_block[33] = 8'hBE; assign init_block[34] = 8'h3E;
    // Master current control
    assign init_block[35] = 8'h87; assign init_block[36] = 8'h06;
    // Set column address
    assign init_block[37] = 8'h15; assign init_block[38] = 8'h00; assign init_block[39] = 8'h5F;
    // Set row address
    assign init_block[40] = 8'h75; assign init_block[41] = 8'h00; assign init_block[42] = 8'h3F;
    // Set display on
    assign init_block[43] = 8'hAF;

    localparam INIT_SIZE = 44;

    reg [1:0] reset_cnt;
    reg [22:0] counter;
    reg [15:0] init_cnt;
    reg [7:0]  data;
    reg dc;
    
    wire clk;
    pll pll(
        .clki(clk_25mhz),
        .clko(clk)
    );

    always @(posedge clk) begin
        counter <= counter + 1;
        if (reset_cnt!=2'b10) 
        begin
            reset_cnt <= reset_cnt+1;
            init_cnt <= 15'd0;
            data <= 8'd0;
            dc <= 0;
        end
        else if (init_cnt[15:4]!=INIT_SIZE) 
        begin
            init_cnt <= init_cnt+1;
            if (init_cnt[3:0]==4'b0000) 
            begin
                if (dc== 0)
                    data <= init_block[init_cnt[15:4]];
                else
                    data <= 8'h88;
            end
            else if (init_cnt[0] == 1'b0) 
            begin
                data[7:0] <= { data[6:0], 1'b0 };
            end
        end

        if (init_cnt[15:4]==INIT_SIZE) begin
            dc <= 1'b1;
        end
        if (init_cnt[15:4]==INIT_SIZE) begin
            init_cnt[15:4] <= INIT_SIZE - 1;
        end
    end

    assign wifi_gpio0 = 1'b1;
    assign oled_resn = ~reset_cnt[0];
    assign oled_csn = reset_cnt[0]; 
    assign oled_dc = dc;
    assign oled_clk = ~init_cnt[0];
    assign oled_mosi = data[7];

endmodule
