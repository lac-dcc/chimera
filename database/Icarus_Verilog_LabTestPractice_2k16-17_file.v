/*ToDo: Solution is not working right now, correct it */
`define S0 2'b00
`define S1 2'b01
`define S2 2'b10
`define S3 2'b11

module bht(
    output [1:0] outp,
    input [1:0] inp,
    input [9:0] address,
    input clk,
    input write
);
    wire [1:0] outp;
    integer i;
    reg [1:0] bhtTable [0:1023];
    initial begin
        for(i = 0; i < 1024; i = i+1) begin
            bhtTable[i] = 2'b0;
        end
        // outp = 2'b0;
    end
    
    always @(negedge clk) begin
        
        if(write == 1)
            bhtTable[address] = inp;
    end 

    assign outp = bhtTable[address];
        // $display("address = %b, bhtTable[address] = %b",address, bhtTable[address]);
endmodule

module mux(
    output [1:0] outp,
    input [1:0] inp1,
    input [1:0] inp2,
    input sel
);
    
    reg [1:0] outp;
    always @* begin
        if(sel)
            outp = inp2;
        else
            outp = inp1;
    end

endmodule

module predictor(
    output [1:0] nextState,
    input taken,
    input clock
);

    reg [1:0] currState, nextState;

    initial 
        currState = `S0;
    
    always @(posedge clock) begin
        case({currState,taken}) 

            {`S0,1'b0} :   nextState <= `S0;
            {`S0,1'b1} :   nextState <= `S1;

            {`S1,1'b0} :   nextState <= `S0;
            {`S1,1'b1} :   nextState <= `S3;

            {`S2,1'b0} :   nextState <= `S0;
            {`S2,1'b1} :   nextState <= `S3;

            {`S3,1'b0} :   nextState <= `S2;
            {`S3,1'b1} :   nextState <= `S3;

            default :   begin
                            $display("insisde default case.., currState: %d, taken : %b", currState, taken);
                            nextState <= `S0;
                        end
        endcase

        currState <= nextState;
    end

endmodule

module intg(
    output predn,
    input [9:0] address,
    input taken,
    input clock
);
    reg predn;
    initial 
        predn = 1'b0;
    
    wire [1:0] bhtOut1, bhtOut2;
    wire [1:0] nextState;
    wire [1:0] branchPredn;

    reg writeBht1, writeBht2;

    initial begin
        writeBht1 = 1'b0;
        writeBht2 = 1'b0;
    end
    // writeBht2 = ~writeBht1;

    // assign writeBht1 = ~taken;

    bht bht1(.outp(bhtOut1), .inp(nextState), .address(address), .write(writeBht1), .clk(clock));
    bht bht2(.outp(bhtOut2), .inp(nextState), .address(address), .write(writeBht2), .clk(clock));

    mux mux1(.outp(branchPredn), .inp1(bhtOut1), .inp2(bhtOut2), .sel(predn));
    predictor p1(.nextState(nextState), .taken(taken), .clock(clock));

    always @(branchPredn or nextState) begin
        case (branchPredn)

            `S0 : begin
                        $display("S0: Not taken");
                        predn = 1'b0;
                        writeBht1 = 1'b1;
                    #10  writeBht1 = 1'b0;
                  end

            `S1 : begin
                        $display("S1: Not taken");
                        predn = 1'b0;
                        writeBht1 = 1'b1;
                    #10  writeBht1 = 1'b0;
                  end

            `S2 : begin
                        $display("S2: Taken");
                        predn = 1'b1;
                        writeBht2 = 1'b1;
                    #10  writeBht2 = 1'b0;
                  end

            `S3 : begin
                        $display("S3: Taken");
                        predn = 1'b1;
                        writeBht2 = 1'b1;
                    #10  writeBht2 = 1'b0;
                  end


        default  : begin
                    $display("Not taken");
                    predn = 1'b0;
                  end
        endcase

    end

endmodule

module tb_intg();   
    
    initial begin
        $dumpfile("file.vcd");
        $dumpvars;
    end

    reg [9:0] address;
    wire prediction;
    reg  actualOutcome;
    reg clock;

    initial begin
        clock = 1'b0;
        actualOutcome = 1'b0;
    end
    
    always
        #5 clock = ~clock;
    
    intg mod(prediction, address, actualOutcome, clock);

    initial begin
            address = 10'b0011110000;
        #10  actualOutcome = 1'b0;
        #10  actualOutcome = 1'b1;
        #10  actualOutcome = 1'b1;
        #10  actualOutcome = 1'b1;
        #10  actualOutcome = 1'b0;
        #50  $finish;
    end

endmodule
