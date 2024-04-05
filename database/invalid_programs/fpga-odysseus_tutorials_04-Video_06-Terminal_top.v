`default_nettype none

module top (
    input wire clk_25mhz,

    output wire oled_csn,
    output wire oled_clk,
    output wire oled_mosi,
    output wire oled_dc,
    output wire oled_resn,
    output wifi_gpio0,
    input wire ftdi_txd
);
    assign wifi_gpio0 = 1'b1;

    wire clk;
    wire locked;
    pll pll(
        .clki(clk_25mhz),
        .clko(clk),
        .locked(locked)
    );

    wire [7:0] x;
    wire [5:0] y;
    wire [7:0] color;

    spi_video video(
        .clk(clk),
        .oled_csn(oled_csn),
        .oled_clk(oled_clk),
        .oled_mosi(oled_mosi),
        .oled_dc(oled_dc),
        .oled_resn(oled_resn),
        .x(x),
        .y(y),
        .color(color)
    );

    reg [7:0] mem [0:47];

    integer k;

    initial
    begin
      for (k = 0; k < 48; k = k + 1)
        mem[k] <= 32;      
    end

    wire rx_valid;
    wire [7:0] uart_out;
    
    uart_rx uart(
        .clk(clk),
        .resetn(locked),

        .ser_rx(ftdi_txd),

        .cfg_divider(12500000/115200),

        .data(uart_out),
        .valid(rx_valid)
    );

    wire [5:0] pos;
    reg [3:0] p_x;
    reg [1:0] p_y;

    reg valid;
    reg [7:0] display_char;

    assign pos = p_x + p_y*12;
    always @(posedge clk) begin
        if (valid) begin
            mem[pos] <= display_char;

        end
    end


    reg state;

    always @(posedge clk) 
    begin
        if (!locked)     
        begin        
            state <= 0;
            p_x <= 0;
            p_y <= 0;
            valid <= 0;
        end
        else
        begin
            case (state)
                0: begin  // receiving char
                    if (rx_valid) 
                    begin                
                        valid <= 1;
                        display_char <= uart_out;
                        state <= 1;
                    end
                    end
                1: begin  // display char
                    if (p_x < 11)
                        p_x <= p_x + 1;
                    else
                    begin
                        p_y <= p_y + 1;
                        p_x <= 0;
                    end
                    valid <= 0;
                    state <= 0;
                    end
            endcase  
        end
    end

    wire [7:0] data_out;

    font_rom vga_font(
        .clk(clk),
        .addr({ mem[(y >> 4) * 12 + (x>>3)], y[3:0] }),
        .data_out(data_out)
    );

    assign color = data_out[7-x[2:0]+1] ? 8'hff : 8'h00; // +1 for sync

endmodule
