// This program was cloned from: https://github.com/Mr-Kaushal-22/WS2812_Interfacing
// License: MIT License

module ws2812_interface (
    input           clk,
    input [23:0]    rgb_data,
    input [7:0]     address,
    input           write,
    input [19:0]    data_depth,
    input [11:0]    num_leds,
    output reg      data
);

/*
period 1200ns:define
    * t on  800ns
    * t off 400ns

end of frame/reset is > 300us.

More recent ws2812 parts require reset > 280us.

clock period at 50MHz = 20ns:
    * high/low counter = 40, makes   = 800ns
    * high/low counter = 20, makes   = 400ns
    * reset is 15000 counts          = 300us
    * Delay is 15000000 counts       = 300ms
*/


reg [23:0] led_reg [1000000:0];

reg [11:0]              led_counter = 0;
reg [4:0]               rgb_counter = 0;
reg [23:0]              led_color = 0;
reg [10:0]              high_count = 0;
reg [10:0]              low_count = 0;
reg [31:0]              reset_count = 0;
reg [19:0]              data_count = 0;


// handle reading new led data
always @(posedge clk) begin
    if(write)
        led_reg[address] <= rgb_data;
end

/* State machine parameters */
reg [3:0]   state = 0;
localparam IDLE     = 4'h0;
localparam READ     = 4'h1;
localparam DECODE   = 4'h2;
localparam HIGH     = 4'h3;
localparam LOW      = 4'h4;
localparam RESET    = 4'h5;
localparam DELAY    = 4'h6;

always @(posedge clk) begin
    case (state) 
        IDLE: begin
            led_counter <= 0;
            reset_count <= 'd15000;
            state <= READ;
        end
        
        READ: begin
            led_color <= led_reg[data_count];
            rgb_counter <= 5'd23;
            state <= DECODE;
        end
        
        DECODE: begin
            if(led_color[rgb_counter]) begin
                high_count <= 'd40;
                low_count <= 'd20;
            end else begin
                high_count <= 'd20;
                low_count <= 'd40;
            end
            state <= HIGH;
        end
        
        HIGH: begin
            data <= 1;
            high_count <= high_count - 1;
            
            if(high_count == 0) begin
                state <= LOW;
            end else begin
                state <= HIGH;
            end
        end
        
        LOW: begin
            data <= 0;
            low_count <= low_count - 1;
            
            if(low_count == 0) begin
                if(rgb_counter > 0) begin
                    rgb_counter <= rgb_counter - 1;
                    state <= DECODE;
                end else begin
                    if(data_count < data_depth-1) begin
                        data_count <= data_count + 1;
                    end else begin
                        data_count <= 0;
                    end
                    
                    if(led_counter < num_leds-1) begin
                        led_counter <= led_counter + 1;
                        state <= READ;
                    end else begin
                        state <= RESET;
                    end
                end
            end else begin
                state <= LOW;
            end
        end
        
        RESET: begin
            data <= 0;
            reset_count <= reset_count - 1;
            
            if(reset_count == 0) begin
                reset_count <= 'd15000000;
                state <= DELAY;
            end else begin
                state <= RESET;
            end
        end
        
        DELAY: begin
            data <= 0;
            reset_count <= reset_count - 1;
            
            if(reset_count == 0) begin
                state <= IDLE;
            end else begin
                state <= DELAY;
            end
        end
    endcase
end
endmodule
