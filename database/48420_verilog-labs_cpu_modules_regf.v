// This program was cloned from: https://github.com/RustamSubkhankulov/verilog-labs
// License: MIT License

module regf(
    
    /* Input clocking signal */
    input wire clk,
    
    /* Two register addresses */
    input wire [4:0]raddr0,
    input wire [4:0]raddr1,

    /* Control signal - Write Enable */
    input wire we,

    /* Write register address */
    input wire [4:0]waddr,
    
    /* Data to be written to register */
    input wire [31:0]wdata,

    /* Register read by raddr0 addres */
    output wire [31:0]rdata0,
    
    /* Register read by raddr1 addres */
    output wire [31:0]rdata1
);

/* 32 registers, 32 bits wide each (x0-x31)  */
wire [31:0]x[31:0];

/* x0 is hardwired zero */
assign x[0] = 32'h0;

/* 31 registers containing values */
reg [31:0]registers[30:0];

generate
    genvar i;

    /* Initalize all registers with zeros */
    for (i = 1; i < 32; i = i + 1) begin: reg_init
        initial
            registers[i-1] = 32'h0;
    end

    /* Assign x[i] to corresponding reg */
    for (i = 1; i <= 31; i = i + 1) begin
        assign x[i] = registers[i-1];
    end

endgenerate

/* Read logic */
assign rdata0 = x[raddr0];
assign rdata1 = x[raddr1];

always @(posedge clk) begin
    
    /* Write logic */
    if (we && waddr) begin
        registers[waddr-1] <= wdata;
    end

    /*
    $strobe("x0:  %h x1:  %h x2:  %h x3:  %h \n", x[0],  x[1],  x[2],  x[3]);
    $strobe("x4:  %h x5:  %h x6:  %h x7:  %h \n", x[4],  x[5],  x[6],  x[7]);
    $strobe("x8:  %h x9:  %h x10: %h x11: %h \n", x[8],  x[9],  x[10], x[11]);
    $strobe("x12: %h x13: %h x14: %h x15: %h \n", x[12], x[13], x[14], x[15]);
    $strobe("x16: %h x17: %h x18: %h x19: %h \n", x[16], x[17], x[18], x[19]);
    $strobe("x20: %h x21: %h x22: %h x23: %h \n", x[20], x[21], x[22], x[23]);
    $strobe("x24: %h x25: %h x26: %h x27: %h \n", x[24], x[25], x[26], x[27]);
    $strobe("x28: %h x29: %h x30: %h x31: %h \n", x[28], x[29], x[30], x[31]);
    */
end

endmodule
