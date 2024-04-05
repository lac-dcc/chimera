module joypad(
    clock460800hz, clockgb, resetn, joy_int,
    address, indata, outdata, load, store,
    
    //////////// Uart to USB //////////
    UART_RX,
    UART_TX
);

input clock460800hz;
input clockgb;
input resetn;
output reg joy_int;

input [15:0] address;
input [7:0] indata;
output [7:0] outdata;
input load;
input store;

input UART_RX;
output UART_TX = 1'b1;


reg [1:0] joy_sel;
reg [7:0] joy_buttons;

reg [7:0] joy_outdata;

always @(*) begin
    joy_outdata = {2'b0, joy_sel, 4'hf};
    
    if (joy_sel[0]) begin
        joy_outdata = joy_outdata & ~joy_buttons[3:0];
    end
    
    if (joy_sel[1]) begin
        joy_outdata = joy_outdata & ~joy_buttons[7:4];
    end
end


wire [7:0] uart_data;
wire uart_recv;

uartrx uartrx(
    clock460800hz, resetn, uart_data, uart_recv,
    UART_RX
);

always @(posedge clockgb or negedge resetn) begin
    if (!resetn) begin
        joy_sel <= 0;
        joy_buttons <= 0;
        joy_int <= 0;
    end else begin
        joy_int <= 0;
    
        if (joy_store) begin
            joy_sel <= joy_indata[5:4];
        end
        
        if (uart_recv) begin
            joy_buttons <= uart_data;
            
            if (uart_data & ~joy_buttons) begin
                joy_int <= 1'b1;
            end
        end
    end
end


wire [7:0] joy_indata;
wire joy_store;

rrmmap #(16'hff00) joy_mmap(
    clockgb, resetn,
    address, indata, outdata, load, store,,
    joy_indata, joy_outdata,, joy_store
);

endmodule
