/********************MangoMIPS32*******************
Filename:   WriteBack.v
Author:     RickyTino
Version:    v1.1.3
**************************************************/
`include "../Config.v"
`include "../Defines.v"

module WriteBack
(
    input  wire [`ALUOp  ] aluop,
    input  wire [`DataBus] alures,
    input  wire [`DataBus] mulres,
    input  wire [`AddrBus] m_vaddr,
    input  wire [`DataBus] m_rdata,
    output reg  [`DataBus] wrdata,
    output wire            stallreq
);

    assign stallreq = (aluop == `ALU_WAIT);

    always @(*) begin
        case (aluop)
            `ALU_LB: begin
                case (m_vaddr[1:0])
                    2'b00: wrdata <= {{24{m_rdata[ 7]}}, m_rdata[ 7: 0]};
                    2'b01: wrdata <= {{24{m_rdata[15]}}, m_rdata[15: 8]};
                    2'b10: wrdata <= {{24{m_rdata[23]}}, m_rdata[23:16]};
                    2'b11: wrdata <= {{24{m_rdata[31]}}, m_rdata[31:24]};
                endcase
            end
            
            `ALU_LBU: begin
                case (m_vaddr[1:0])
                    2'b00: wrdata <= {24'b0, m_rdata[ 7: 0]};
                    2'b01: wrdata <= {24'b0, m_rdata[15: 8]};
                    2'b10: wrdata <= {24'b0, m_rdata[23:16]};
                    2'b11: wrdata <= {24'b0, m_rdata[31:24]};
                endcase
            end
            
            `ALU_LH: begin
                case (m_vaddr[1:0])
                    2'b00:   wrdata <= {{16{m_rdata[15]}}, m_rdata[15: 0]};
                    2'b10:   wrdata <= {{16{m_rdata[31]}}, m_rdata[31:16]};
                    default: wrdata <= `ZeroWord;
                endcase
            end
            
            `ALU_LHU: begin
                case (m_vaddr[1:0])
                    2'b00:   wrdata <= {16'b0, m_rdata[15: 0]};
                    2'b10:   wrdata <= {16'b0, m_rdata[31:16]};
                    default: wrdata <= `ZeroWord;
                endcase
            end
            
            `ALU_LW,
            `ALU_LL: begin
                wrdata  <= m_rdata;
            end

            `ALU_LWL: begin
                case (m_vaddr[1:0])
                    2'b00: wrdata <= {m_rdata[ 7:0], 24'b0};
                    2'b01: wrdata <= {m_rdata[15:0], 16'b0};
                    2'b10: wrdata <= {m_rdata[23:0],  8'b0};
                    2'b11: wrdata <=  m_rdata[31:0];
                endcase
            end
            
            `ALU_LWR: begin
                case (m_vaddr[1:0])
                    2'b00: wrdata <=         m_rdata[31: 0];
                    2'b01: wrdata <= { 8'b0, m_rdata[31: 8]};
                    2'b10: wrdata <= {16'b0, m_rdata[31:16]};
                    2'b11: wrdata <= {24'b0, m_rdata[31:24]};
                endcase
            end
            
            `ALU_MUL: wrdata <= mulres;
            default:  wrdata  <= alures;
        endcase
    end

endmodule