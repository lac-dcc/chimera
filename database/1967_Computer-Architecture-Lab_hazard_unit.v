// This program was cloned from: https://github.com/matahho/Computer-Architecture-Lab
// License: MIT License

module HazardUnit(
    input [3:0] rn, rdm,
    input twoSrc,
    input [3:0] destEx, destMem,
    input wbEnEx, wbEnMem, memREn,
    input forwardEn,
    output reg hazard
);
    always @(rn, rdm, destEx, destMem, wbEnEx, wbEnMem, memREn, twoSrc, forwardEn) begin
        hazard = 1'b0;
        if (forwardEn) begin
            if (memREn) begin
                if (rn == destEx || (twoSrc && rdm == destEx)) begin
                    hazard = 1'b1;
                end
            end
        end
        else begin
            if (wbEnEx) begin
                if (rn == destEx || (twoSrc && rdm == destEx)) begin
                    hazard = 1'b1;
                end
            end
            if (wbEnMem) begin
                if (rn == destMem || (twoSrc && rdm == destMem)) begin
                    hazard = 1'b1;
                end
            end
        end
    end
endmodule
