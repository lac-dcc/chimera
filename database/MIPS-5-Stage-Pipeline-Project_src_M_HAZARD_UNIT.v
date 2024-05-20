// This program was cloned from: https://github.com/the-pinbo/MIPS-5-Stage-Pipeline-Project
// License: MIT License

module M_HAZARD_UNIT (
    input branch,
    input memtoregE, memtoregM,
    input[4:0] rsD, rtD,
    input regwriteE, regwriteM, regwriteW,
    input[4:0] rsE, rtE,
    input[4:0] writeregE, writeregM, writeregW,
    output reg [1:0] forwardAE, forwardBE,
    output reg stallF, stallD, flushE,
    output reg forwardAD, forwardBD);

    reg lwstall;
    reg branchstall;

    always @(*) begin
        
        //$display("rsE=%h, rtE=%h, writeregM=%h, regwriteM=%h, writeregW=%h, regwriteW=%h", rsE, rtE, writeregM, regwriteM, writeregW, regwriteW);
        
        // forwarding logic
        if((rsE != 5'b00000) && (rsE == writeregM) && regwriteM) 
            forwardAE = 2'b10;
        else if ((rsE != 5'b00000) && (rsE == writeregW) && regwriteW)
            forwardAE = 2'b01;
        else 
            forwardAE = 2'b00;

        if((rtE != 5'b00000) && (rtE == writeregM) && regwriteM) 
            forwardBE = 2'b10;
        else if ((rtE != 5'b00000) && (rtE == writeregW) && regwriteW)
            forwardBE = 2'b01;
        else 
            forwardBE = 2'b00;

        // memory delay stall
        lwstall = ((rsD == rtE) || (rtD == rtE)) && memtoregE;

        forwardAD = ((rsD != 0) && (rsD == writeregM) && regwriteM);
        forwardBD = ((rtD != 0) && (rtD == writeregM) && regwriteM);

        // branch delay stall
        branchstall = (branch && regwriteE && ((writeregE == rsD) || (writeregE == rtD))) || (branch && memtoregM && ((writeregM == rsD) || (writeregM == rtD)));

        stallF = lwstall || branchstall;
        stallD = lwstall || branchstall;
        flushE = lwstall || branchstall;
    end

    always@(lwstall) begin
        case(lwstall)
            1'b1: $display("lwstall=%b", lwstall);
        endcase
    end

    always@(branchstall) begin
        case(branchstall)
            1'b1: $display("branchstall=%b", branchstall);
        endcase
    end
endmodule