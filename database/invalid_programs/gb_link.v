module link(
    clock115200hz, clockgb, resetn,
    address, indata, outdata, load, store,

    //////////// Uart to USB //////////
    UART_RX,
    UART_TX
);


input clock115200hz;
input clockgb;
input resetn;

input [15:0] address;
input [7:0] indata;
output [7:0] outdata;
input load;
input store;

input UART_RX;
output UART_TX = tx;


reg [7:0] data;
reg sending;

reg [3:0] state;
reg tx;


always @(posedge clock115200hz or negedge resetn) begin
    if (!resetn) begin
        tx <= 1'b1;
        state <= 0;
    end else begin
        if (state == 0) begin
            tx <= 1'b1;
            state <= sending ? 4'h1 : 4'h0;
        end else begin
            tx <= state == 4'h1 ? 1'h0 : data[state-2];
            state <= state == 4'h9 ? 4'h0 : state + 1'b1;
        end
    end
end

always @(posedge clockgb or negedge resetn) begin
    if (!resetn) begin
        data <= 0;
        sending <= 0;
    end else begin
        if (sio_store) begin
            sending <= sio_indata[7];
        end else if (state != 0) begin
            sending <= 0;
        end
        
        if (data_store) begin
            data <= data_indata;
        end
    end
end


wire [7:0] data_indata;
wire [7:0] data_data;
wire data_store;

rrmmap #(16'hff01) data_mmap(
    clockgb, resetn,
    address, indata, data_data, load, store,, 
    data_indata, data,, data_store
);

wire [7:0] sio_indata;
wire [7:0] sio_data;
wire sio_store;

rrmmap #(16'hff02) sio_mmap(
    clockgb, resetn,
    address, indata, sio_data, load, store,, 
    sio_indata, {state != 0 || sending, 7'h00},, sio_store
);

wire [7:0] outdata = data_data | sio_data;

endmodule
