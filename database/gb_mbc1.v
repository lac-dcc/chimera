module mbc1(
    clockgb, clock115200hz, clock460800hz, resetn,
    address, indata, outdata, load, store, prog,
    
    //////////// Uart to USB //////////
	UART_RX,
    UART_TX,
    
    //////////// SRAM //////////
	SRAM_A,
	SRAM_CE_n,
	SRAM_D,
	SRAM_LB_n,
	SRAM_OE_n,
	SRAM_UB_n,
	SRAM_WE_n
);

input clockgb;
input clock115200hz;
input clock460800hz;
input resetn;

input [15:0] address;
input [7:0] indata;
output [7:0] outdata;
input load;
input store;
input prog;

//////////// Uart to USB //////////
input UART_RX;
output UART_TX;

//////////// SRAM //////////
output [17:0] SRAM_A;
inout [15:0] SRAM_D;
output SRAM_CE_n;
output SRAM_UB_n;
output SRAM_LB_n;
output SRAM_OE_n;
output SRAM_WE_n;


// Banked ROM //
reg [18:0] sram_address;
wire [7:0] sram_data;

sram cart_sram(
    clockgb, clock115200hz, clock460800hz, resetn,
    sram_address,, sram_data, load, 1'b0, prog, 
    
    //////////// Uart to USB //////////
	UART_RX,
    UART_TX,
    
    //////////// SRAM //////////
	SRAM_A,
	SRAM_CE_n,
	SRAM_D,
	SRAM_LB_n,
	SRAM_OE_n,
	SRAM_UB_n,
	SRAM_WE_n
);


reg [4:0] bank;

always @(*) begin
    if (rom_address < 16'h4000) begin
        sram_address = {5'b0, rom_address[13:0]};
    end else begin
        sram_address = {bank, rom_address[13:0]};
    end
end

always @(posedge clockgb or negedge resetn) begin
    if (!resetn) begin
        bank <= 5'b1;
    end else begin
        if (bank_store) begin
            if (bank_indata[4:0] == 0) begin
                bank <= 5'b1;
            end else begin
                bank <= bank_indata[4:0];
            end
        end
    end
end 


wire [15:0] rom_address;
wire [7:0] rom_data;

mmap #(16'h0000, 16'h7fff) rom_mmap(
    clockgb, resetn,
    address, indata, rom_data, load, store,
    rom_address,, sram_data
);

wire [7:0] bank_indata;
wire bank_store;

mmap #(16'h2000, 16'h3fff) bank_mmap(
    clockgb, resetn,
    address, indata,, load, store,, 
    bank_indata,,, bank_store
);


// Banked RAM //
wire [15:0] ram_address;
wire [7:0] ram_indata;
wire [7:0] ram_outdata;
wire [7:0] ram_data;
wire ram_store;

mbc1ram ram(
	ram_address[12:0],
	clockgb,
	ram_indata,
	ram_store,
	ram_outdata
);

mmap #(16'ha000, 16'hbfff) ram_mmap(
    clockgb, resetn,
    address, outdata, ram_data, load, store,
    ram_address, ram_indata, ram_outdata,, ram_store
);

assign outdata = rom_data | ram_data;

endmodule
