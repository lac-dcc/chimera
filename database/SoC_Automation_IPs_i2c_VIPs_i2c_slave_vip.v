// This program was cloned from: https://github.com/habibagamal/SoC_Automation
// License: GNU General Public License v2.0

/*******************************************************************
 *
 * Module: i2c_slave.v
 * Project: Raptor
 * Author: mshalan
 * Description: An i2c slave VIP for OC i2c master testbench
 *
 **********************************************************************/

`timescale 1ns/1ns

module i2c_slave_vip(
    inout scl, sda,
    input rst, clk,
    output[7:0] i2c_data
);

    parameter[7:0] SIDLE=8'h1, SADDR=8'h2, SACK1=8'h4, SDATA=8'h8, SACK2=8'h10;

    reg scl_en, sda_en;

    reg sda_o, scl_o;
    wire sda_i, scl_i;

    assign sda = sda_en ? sda_o : 1'bz;
    assign scl = scl_en ? scl_o : 1'bz;

    assign scl_i = scl;
    assign sda_i = sda;

    reg[4:0] cntr;
    reg[7:0] state, addr, data;
    reg[1:0] cfsm;

    //
    always @ (posedge clk or posedge rst)
    if(rst)
        state <= SIDLE;

    // Start Bit
    always @ (negedge sda_i)
        if(scl_i) begin
            state <= SADDR;
            addr <= 8'd0;
            data <= 0;
            cntr <= 0;
        end

    always @ (posedge scl_i)
        if(state == SADDR) begin
            addr <= {addr[6:0], sda_i};
        end
        else
            if(state == SDATA) begin
                data <= {data[6:0], sda_i};
        end

    always @ (posedge scl_i)
      if((state== SADDR) || (state==SDATA)) cntr <= cntr + 1;

    always @ (negedge scl_i)
        if(cntr==8 )
            sda_en <= 1;
        else
            sda_en <= 0;

    always @ (negedge scl_i)
        if(cntr==8)  state = SDATA;
        else if((state== SDATA) && (cntr==17)) begin
          state<=SIDLE;
          // $display("i2c Slave has received 0x%X - Address: 0x%X", data, addr);
    end

    initial begin
      scl_en = 0;
      sda_en = 0;
      sda_o = 0;
    end

    assign i2c_data = data;

endmodule