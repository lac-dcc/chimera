// This program was cloned from: https://github.com/b224hisl/rioschip
// License: Apache License 2.0

`include "../params.vh"

module ptw
    # (
    parameter PTE_SIZE = 8,
    parameter PTE_SIZE_IN_BIT = 64,

    parameter VIRTUAL_ADDR_LEN_SV39 = 39,
    parameter PHYSICAL_ADDR_LEN_SV39 = 56,
    parameter PAGE_OFFSET_WIDTH = 12,

    parameter VPN_SLICE_WIDTH = 9
)
    (
    input                                   ptw_enable_i,
    input [1:0]                             page_table_level_i,

    input [VIRTUAL_ADDR_LEN_SV39 - 1 : 0]   virtual_address_i,

    input                                   pte_active_i,
    input [PTE_SIZE_IN_BIT - 1 : 0]         pte_i,
    input [SATP_PPN_WIDTH - 1 : 0]          satp_ppn_i,


    output                                  pte_is_leaf_o,
    output                                  req_next_level_pte_o,
    output [PHYSICAL_ADDR_LEN_SV39 - 1 : 0] pte_req_address_o,

    output                                  page_fault_valid_o
);
    reg pte_is_leaf;
    reg req_next_level_pte;
    reg [PHYSICAL_ADDR_LEN_SV39 - 1 : 0]    pte_req_address;
    reg [VPN_SLICE_WIDTH - 1: 0]            pte_req_index;

    reg page_fault_valid;

    assign pte_is_leaf_o = pte_is_leaf;
    assign req_next_level_pte_o = req_next_level_pte;
    assign pte_req_address_o = pte_req_address;
    assign page_fault_valid_o = page_fault_valid;


    always @(*) begin

        if (ptw_enable_i) begin

            case (page_table_level_i)
                2'b10:  pte_req_index = virtual_address_i[`va_vpn2];
                2'b01:  pte_req_index = virtual_address_i[`va_vpn1];
                2'b00:  pte_req_index = virtual_address_i[`va_vpn0];
                default:  page_fault_valid = 1'b1;
            endcase

            if (pte_active_i) begin

                pte_req_address = ({12'h000,pte_i[`pte_ppn]} << PAGE_OFFSET_WIDTH) + pte_req_index * PTE_SIZE;

                // Step 4: Leaf/Non-leaf pte check
                casez ({pte_i[`pte_x],pte_i[`pte_w],pte_i[`pte_r],pte_i[`pte_v]})
                    // pte.v = 0 ==> page fault
                    4'b???0: begin
                        pte_is_leaf = 1'b0;
                        req_next_level_pte = 1'b0;
                        page_fault_valid = 1'b1;
                    end
                    // pte.r = 0 and pte.w = 1 ==> page fault
                    4'b?101: begin
                        pte_is_leaf = 1'b0;
                        req_next_level_pte = 1'b0;
                        page_fault_valid = 1'b1;
                    end
                    // pte.x = 1 ==> leaf pte
                    // @TODO: x-only pte is for I-TLB
                    4'b1001: begin
                        pte_is_leaf = 1'b1;
                        req_next_level_pte = 1'b0;
                        page_fault_valid = 1'b0;
                    end
                    // pte.r = 1 ==> leaf pte
                    4'b??11: begin
                        pte_is_leaf = 1'b1;
                        req_next_level_pte = 1'b0;
                        page_fault_valid = 1'b0;
                    end
                    // default ==> request next level pte
                    default: begin
                        pte_is_leaf = 1'b0;
                        req_next_level_pte = 1'b1;
                        page_fault_valid = 1'b0;
                    end
                endcase

            end else begin
                pte_is_leaf = 1'b0;
                req_next_level_pte = 1'b1;
                pte_req_address = ({12'h000,satp_ppn_i} << PAGE_OFFSET_WIDTH) + pte_req_index * PTE_SIZE;
                page_fault_valid = 1'b0;
            end

        end else begin
            pte_is_leaf = 1'b0;
            req_next_level_pte = 1'b0;
            pte_req_address = '0;
            page_fault_valid = 1'b0;
        end


    end

endmodule

