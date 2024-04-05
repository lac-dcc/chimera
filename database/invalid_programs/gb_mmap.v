module mmap(
    clock, resetn,
    m_address, m_indata, m_outdata, m_load, m_store,
    address, indata, outdata, load, store
);

parameter START;
parameter END = START;

input clock;
input resetn;

input [15:0] m_address;
input [7:0] m_indata;
output reg [7:0] m_outdata;
input m_load;
input m_store;

output reg [15:0] address;
output reg [7:0] indata;
input [7:0] outdata;
output reg load;
output reg store;

reg [15:0] r_load [2];

always @(*) begin
    if (m_address >= START && m_address <= END) begin
        address = m_address - START;
        indata = m_indata;
        load = m_load;
        store = m_store;
    end else begin
        address = 0;
        indata = 0;
        load = 0;
        store = 0;
    end
    
    if (r_load[1]) begin
        m_outdata = outdata;
    end else begin
        m_outdata = 0;
    end
end

always @(posedge clock or negedge resetn) begin
    if (!resetn) begin
        r_load[0] <= 0;
        r_load[1] <= 0;
    end else begin
        r_load[0] <= load;
        r_load[1] <= r_load[0];
    end
end

endmodule


module rmmap(
    clock, resetn,
    m_address, m_indata, m_outdata, m_load, m_store,
    address, indata, outdata, load, store
);

parameter START;
parameter END = START;

input clock;
input resetn;

input [15:0] m_address;
input [7:0] m_indata;
output [7:0] m_outdata;
input m_load;
input m_store;

output reg [15:0] address;
output reg [7:0] indata;
input [7:0] outdata;
output reg load;
output reg store;

wire [15:0] r_address;
wire [7:0] r_indata;
wire r_load;
wire r_store;

mmap #(START, END) mmap(
    clock, resetn,
    m_address, m_indata, m_outdata, m_load, m_store,
    r_address, r_indata, outdata, r_load, r_store
);

always @(posedge clock or negedge resetn) begin
    if (!resetn) begin
        address <= 0;
        indata <= 0;
        load <= 0;
        store <= 0;
    end else begin
        address <= r_address;
        indata <= r_indata;
        load <= r_load;
        store <= r_store;
    end
end

endmodule  


module rrmmap(
    clock, resetn,
    m_address, m_indata, m_outdata, m_load, m_store,
    address, indata, outdata, load, store
);

parameter START;
parameter END = START;

input clock;
input resetn;

input [15:0] m_address;
input [7:0] m_indata;
output [7:0] m_outdata;
input m_load;
input m_store;

output [15:0] address;
output [7:0] indata;
input [7:0] outdata;
output load;
output store;

reg [7:0] r_outdata;

rmmap #(START, END) rmmap(
    clock, resetn,
    m_address, m_indata, m_outdata, m_load, m_store,
    address, indata, r_outdata, load, store
);

always @(posedge clock or negedge resetn) begin
    if (!resetn) begin
        r_outdata <= 0;
    end else begin
        r_outdata <= outdata;
    end
end

endmodule  
    
    