// This program was cloned from: https://github.com/Johnlon/spam-1
// License: Mozilla Public License 2.0

// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
`include "hct7474.v"
`include "../lib/assertion.v"

module tb();

logic cp, d, _sd, _rd;
wire q, qb;

localparam BLOCKS = 1;

// names: https://assets.nexperia.com/documents/data-sheet/74HC_HCT74.pdf
hct7474 #(.BLOCKS(BLOCKS), .DELAY_RISE(9), .DELAY_FALL(9)) dut( ._SD(_sd), ._RD(_rd), .D(d), .CP(cp), .Q(q), ._Q(qb)); 

initial begin
`ifndef verilator
    $monitor("%9t ", $time, " : cp=%1b,d=%1b,_sd=%1b, _rd=%1b, q=%1b, qb=%1b", cp,d,_sd, _rd, q, qb);
`endif

    cp=0;
    d=1;

    #10
    _rd=1;
    _sd=1;

    #10
    `Equals(q, 1'bx);
    `Equals(qb, 1'bx);

    #10
    _rd=0;
    _sd=0;

    #10
    `Equals(q, 1'b1);
    `Equals(qb, 1'b1);

    #10
    _rd=1;
    _sd=1;

    #10
    `Equals(q, 1'bx); // still no definite value set
    `Equals(qb, 1'bx); // still no definite value set

    $display(" should reset async");
    #10
    _rd=0;
    _sd=1;

    #10
    `Equals(q, 1'b0);
    `Equals(qb, 1'b1); 

    $display(" should stay same");
    #10
    _rd=1;
    _sd=1;

    #10
    `Equals(q, 1'b0);
    `Equals(qb, 1'b1); 

    $display(" should set async");
    #10
    _rd=1;
    _sd=0;

    #10
    `Equals(q, 1'b1);
    `Equals(qb, 1'b0); 

    $display(" should stay same");
    #10
    _rd=1;
    _sd=1;

    #10
    `Equals(q, 1'b1);
    `Equals(qb, 1'b0); 

    $display(" should stay same even if d changes");
    #10
    d=0;

    #10
    `Equals(q, 1'b1);
    `Equals(qb, 1'b0); 

    $display(" should override clock +ve edge with set");
    #10
    _rd=1;
    _sd=0;
    cp=1;

    #10
    `Equals(q, 1'b1);
    `Equals(qb, 1'b0); 


    $display(" should clock in d");
    d=0;
    _rd=1;
    _sd=1;
    cp=0;

    #10
    cp=1;

    #10
    `Equals(q, 1'b0);
    `Equals(qb, 1'b1); 

    $display(" should clock in d");
    d=1;
    _rd=1;
    _sd=1;
    cp=0;

    #10
    cp=1;

    #10
    `Equals(q, 1'b1);
    `Equals(qb, 1'b0); 

    $display(" should clear async");
    d=1;
    _rd=0;
    _sd=1;

    #10
    `Equals(q, 1'b0);
    `Equals(qb, 1'b1); 
end

endmodule
