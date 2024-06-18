// This program was cloned from: https://github.com/matahho/Computer-Architecture-Lab
// License: MIT License

module ForwardingUnit(
    input forwardEn,
    input [3:0] src1, src2,
    input wbEnMem, wbEnWb,
    input [3:0] destMem, destWb,
    output reg [1:0] selSrc1, selSrc2
);
    always @(forwardEn, src1, wbEnMem, wbEnWb, destMem, destWb) begin
        selSrc1 = 2'b00;
        if (forwardEn) begin
            if (wbEnMem && (destMem == src1)) begin
                selSrc1 = 2'b01;
            end
            else if (wbEnWb && (destWb == src1)) begin
                selSrc1 = 2'b10;
            end
        end
    end

    always @(forwardEn, src2, wbEnMem, wbEnWb, destMem, destWb) begin
        selSrc2 = 2'b00;
        if (forwardEn) begin
            if (wbEnMem && (destMem == src2)) begin
                selSrc2 = 2'b01;
            end
            else if (wbEnWb && (destWb == src2)) begin
                selSrc2 = 2'b10;
            end
        end
    end
endmodule
