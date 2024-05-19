// This program was cloned from: https://github.com/b224hisl/rioschip
// License: Apache License 2.0


`include "../params.vh"
module mmu_sv39
    #(
    parameter PTE_SIZE = 8,
    parameter PTE_SIZE_IN_BIT = 64,
    parameter PAGE_TABLE_LEVELS = 3,

    parameter VIRTUAL_ADDR_LEN_SV39 = 39,
    parameter PHYSICAL_ADDR_LEN_SV39 = 56,
    parameter PAGE_OFFSET_WIDTH = 12,

    parameter VPN_WIDTH = 27,
    parameter VPN_SLICE_WIDTH = 9,
    parameter PPN_WIDTH = 44,
    parameter PPN_SLICE_0_WIDTH = 9,
    parameter PPN_SLICE_1_WIDTH = 9,
    parameter PPN_SLICE_2_WIDTH = 26
)
    (
    input                                   clk,
    input                                   rstn,

    input                                   flush_i,

    input [63:0]                            csr_satp_i,
    input [63:0]                            csr_mstatus_i,
    input [1:0]                             priviledge_level_i,

    input [1:0]                             access_mode_i,

    // AGU -> MMU
    input                                   lsu_req_valid_i,
    input [VIRTUAL_ADDR_LEN_SV39 - 1 : 0]   lsu_req_addr_i,
    output                                  lsu_req_ready_o,
    // MMU -> AGU
    output                                  lsu_resp_valid_o,
    output [PHYSICAL_ADDR_LEN_SV39 - 1 : 0] lsu_resp_addr_o,
    input                                   lsu_resp_ready_i,

    // MMU -> Cache
    output                                  ptw_req_valid_o,
    output [PHYSICAL_ADDR_LEN_SV39 - 1 : 0] ptw_req_addr_o,
    output [5:0]                            ptw_req_len_o,
    input                                   ptw_req_ready_i,
    // Cache -> MMU
    input                                   ptw_resp_valid_i,
    input [PTE_SIZE_IN_BIT - 1 : 0]         ptw_resp_pte_i,
    output                                  ptw_resp_ready_o,

    // Fault
    output                                  page_fault_valid_o,
    output [3:0]                            page_fault_cause_o
);
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars;
        $dumpon;
        $dumpall;
        $dumpflush;
    end

    // M0 Stage
    // get input data from LSU/FETCH/CACHE

    // Control signal
    // LSU
    wire m0_lsu_clk_en, m0_lsu_ready, m0_lsu_valid;
    // CACHE
    wire m0_ptw_clk_en, m0_ptw_ready, m0_ptw_valid;
    // Payload
    // LSU
    reg                                                 m0_lsu_valid_d, m0_lsu_valid_q;
    reg [1:0]                                           m0_priviledge_level_d, m0_priviledge_level_q;
    reg                                                 m0_mprv_d, m0_mprv_q;
    reg [1:0]                                           m0_mpp_d, m0_mpp_q;
    reg                                                 m0_smxr_d, m0_smxr_q;
    reg                                                 m0_ssum_d, m0_ssum_q;
    reg [SATP_PPN_WIDTH - 1 : 0]                        m0_satp_ppn_d, m0_satp_ppn_q;
    reg [SATP_ASID_WIDTH - 1 : 0]                       m0_satp_asid_d, m0_satp_asid_q;
    reg [SATP_MODE_WIDTH - 1 : 0]                       m0_satp_mode_d, m0_satp_mode_q;
    reg [VIRTUAL_ADDR_LEN_SV39 - 1 : 0]                 m0_virtual_address_d, m0_virtual_address_q;
    reg [1:0]                                           m0_access_mode_d, m0_access_mode_q;
    reg [1:0]                                           m0_init_page_table_level_d, m0_init_page_table_level_q;
    // CACHE
    reg                                                 m0_ptw_valid_d, m0_ptw_valid_q;
    reg [PTE_SIZE_IN_BIT - 1 : 0]                       m0_ptw_pte_d, m0_ptw_pte_q;
    reg [1:0]                                           m0_ptw_page_table_level_d, m0_ptw_page_table_level_q;


    // M1 Stage
    // Process and generate output

    // Control signal
    wire m1_lsu_clk_en, m1_lsu_valid, m1_lsu_ready;
    wire m1_ptw_clk_en, m1_ptw_valid, m1_ptw_ready;

    wire m1_stall_m0_lsu, m1_stall_m0_ptw;
    wire m1_serve_ptw, m1_serve_lsu;

    // Payload
    reg                                     m1_lsu_valid_d, m1_lsu_valid_q;
    reg                                     m1_ptw_valid_d, m1_ptw_valid_q;
    reg [PHYSICAL_ADDR_LEN_SV39 - 1 : 0]    m1_lsu_resp_addr_d, m1_lsu_resp_addr_q;
    reg [PHYSICAL_ADDR_LEN_SV39 - 1 : 0]    m1_ptw_req_addr_d, m1_ptw_req_addr_q;
    reg                                     m1_page_fault_valid_d, m1_page_fault_valid_q;
    reg [3:0]                               m1_page_fault_cause_d, m1_page_fault_cause_q;

    // Intermediate register
    reg [1:0]                               m1_page_table_level;
    reg [PPN_SLICE_2_WIDTH -1 : 0]          m1_ppn2;
    reg [PPN_SLICE_1_WIDTH -1 : 0]          m1_ppn1;
    reg [PPN_SLICE_0_WIDTH -1 : 0]          m1_ppn0;
    reg [PAGE_OFFSET_WIDTH -1 : 0]          m1_pgoff;

    wire m1_req_next_level_pte;
    wire m1_pte_is_leaf;
    wire m1_pte_valid_leaf;

    wire m1_page_fault_valid_illegal_page_table_level;
    wire m1_page_fault_valid_illegal_req;
    wire m1_page_fault_valid_invalid_pte;
    wire m1_page_fault_valid_inaccessable_leaf_pte;


    // Status management
    reg m0_lsu_active_d, m0_lsu_active_q;
    reg m0_ptw_active_d, m0_ptw_active_q;

    assign m0_lsu_active_d = m0_ptw_valid ? 1'b0 : (m0_lsu_valid ? 1'b1 : m0_lsu_active_q);
    assign m0_ptw_active_d = (m1_pte_is_leaf | m1_page_fault_valid_d) ? 1'b0: (m0_ptw_valid ? 1'b1 : m0_ptw_active_q);
    


    // M0 Stage
    // Output
    assign lsu_req_ready_o      = m0_lsu_ready & m0_ptw_ready;
    assign ptw_resp_ready_o     = m0_ptw_ready;

    // LSU
    // Control
    assign m0_lsu_clk_en            = m0_lsu_ready & m0_lsu_valid;
    assign m0_lsu_ready             = ~m1_stall_m0_lsu;
    assign m0_lsu_valid             = m0_lsu_ready & lsu_req_valid_i;
    // Payload
    assign m0_lsu_valid_d           = ~flush_i & (m1_stall_m0_lsu ? m0_lsu_valid_q : m0_lsu_clk_en);
    assign m0_priviledge_level_d    = priviledge_level_i;
    assign m0_mprv_d                = csr_mstatus_i[17];
    assign m0_mpp_d                 = csr_mstatus_i[12:11];
    assign m0_smxr_d                = csr_mstatus_i[`sstatus_mxr];
    assign m0_ssum_d                = csr_mstatus_i[`sstatus_sum];
    assign m0_satp_ppn_d            = csr_satp_i[SATP_PPN_WIDTH - 1 : 0];
    assign m0_satp_asid_d           = csr_satp_i[SATP_ASID_WIDTH + SATP_PPN_WIDTH - 1 : SATP_PPN_WIDTH];
    assign m0_satp_mode_d           = csr_satp_i[XLEN - 1 : XLEN - SATP_MODE_WIDTH];
    assign m0_virtual_address_d     = lsu_req_addr_i;
    assign m0_access_mode_d         = access_mode_i;
    assign m0_init_page_table_level_d    = PAGE_TABLE_LEVELS - 1;
    // CACHE
    // Control
    assign m0_ptw_clk_en            = m0_ptw_ready & m0_ptw_valid;
    assign m0_ptw_ready             = ~m1_stall_m0_ptw;
    assign m0_ptw_valid             = m0_ptw_ready & ptw_resp_valid_i;
    // Payload
    assign m0_ptw_valid_d           = ~flush_i & (m1_stall_m0_ptw ? m0_ptw_valid_q : m0_ptw_clk_en);
    assign m0_ptw_pte_d                 = ptw_resp_pte_i;

    assign m0_ptw_page_table_level_d    = m1_serve_ptw ? ((m0_ptw_page_table_level_q == 0) ? 0 : m0_ptw_page_table_level_q - 1) : m0_init_page_table_level_q;


    // M1 Stage

    // Output
    assign lsu_resp_valid_o     = m1_lsu_valid_q & ~m1_page_fault_valid_q;
    assign lsu_resp_addr_o      = m1_lsu_resp_addr_q;

    assign ptw_req_valid_o      = m1_ptw_valid_q & ~m1_page_fault_valid_q;
    assign ptw_req_addr_o       = m1_ptw_req_addr_q;
    assign ptw_req_len_o        = PTE_SIZE;

    assign page_fault_valid_o   = m1_page_fault_valid_q;
    assign page_fault_cause_o   = m1_page_fault_cause_q;


    // Internal logic


    // If ptw is activated, lsu requeset should be blocked
    // Priority: ptw > lsu
    assign m1_stall_m0_lsu = m0_lsu_valid_q & (~m1_ptw_ready | ~m1_lsu_ready | m1_serve_ptw);
    assign m1_stall_m0_ptw = m1_serve_ptw & (~m1_ptw_ready | ~m1_lsu_ready);

    assign m1_lsu_clk_en = m1_lsu_valid & m1_lsu_ready;
    // @FIXME
    assign m1_lsu_valid = m1_lsu_ready & ((m0_ptw_valid_q & m1_pte_is_leaf) | m1_page_fault_valid_d);
    assign m1_lsu_ready = lsu_resp_ready_i;

    assign m1_ptw_clk_en = m1_ptw_valid & m1_ptw_ready;
    // @FIXME
    assign m1_ptw_valid = ptw_req_ready_i & ((m0_lsu_valid_q | m0_ptw_valid_q) & m1_req_next_level_pte | m1_page_fault_valid_d);
    assign m1_ptw_ready = ptw_req_ready_i;

    assign m1_lsu_valid_d = ~flush_i & m1_lsu_valid;
    assign m1_ptw_valid_d = ~flush_i & m1_ptw_valid;


    assign m1_serve_ptw         = m0_ptw_active_q;
    assign m1_serve_lsu         = m0_lsu_active_q;
    assign m1_page_table_level  = m1_serve_lsu ? m0_init_page_table_level_q : m0_ptw_page_table_level_q;

    // Page fault logic
    assign m1_page_fault_valid_illegal_req              = m1_serve_lsu & (m0_satp_ppn_q == 0);
    assign m1_page_fault_valid_illegal_page_table_level = (m1_page_table_level == 0) & m1_req_next_level_pte;

    assign m1_page_fault_valid_d = m1_page_fault_valid_inaccessable_leaf_pte | m1_page_fault_valid_invalid_pte | m1_page_fault_valid_illegal_req | m1_page_fault_valid_illegal_page_table_level;
    assign m1_page_fault_cause_d = (m0_access_mode_q == ACCESS_MODE_READ) ? EXCEPTION_LOAD_PAGE_FAULT : ((m0_access_mode_q == ACCESS_MODE_WRITE) ? EXCEPTION_STORE_PAGE_FAULT : EXCEPTION_INSTR_PAGE_FAULT);

    // Generate lsu response physical address
    assign m1_ppn2              = ((m1_page_table_level <= 2) && m1_serve_ptw) ? m0_ptw_pte_q[`pte_ppn2] : {17'b0, m0_virtual_address_q[`va_vpn2]};
    assign m1_ppn1              = ((m1_page_table_level <= 1) && m1_serve_ptw) ? m0_ptw_pte_q[`pte_ppn1] : m0_virtual_address_q[`va_vpn1];
    assign m1_ppn0              = ((m1_page_table_level <= 0) && m1_serve_ptw) ? m0_ptw_pte_q[`pte_ppn0] : m0_virtual_address_q[`va_vpn0];
    assign m1_pgoff             = m0_virtual_address_q[PAGE_OFFSET_WIDTH - 1 :0];
    assign m1_lsu_resp_addr_d   = {m1_ppn2, m1_ppn1, m1_ppn0, m1_pgoff};

    // Generate ptw requeset ppn
    ptw #(
    .PTE_SIZE                   (PTE_SIZE),
    .PTE_SIZE_IN_BIT            (PTE_SIZE_IN_BIT),
    .VIRTUAL_ADDR_LEN_SV39      (VIRTUAL_ADDR_LEN_SV39),
    .PHYSICAL_ADDR_LEN_SV39     (PHYSICAL_ADDR_LEN_SV39),
    .PAGE_OFFSET_WIDTH          (PAGE_OFFSET_WIDTH),
    .VPN_SLICE_WIDTH            (VPN_SLICE_WIDTH)
    ) ptw (
        .ptw_enable_i           (m1_serve_ptw | m1_serve_lsu),
        .page_table_level_i     (m1_page_table_level),
        .virtual_address_i      (m0_virtual_address_q),
        .pte_active_i           (m1_serve_ptw),
        .pte_i                  (m0_ptw_pte_q),
        .satp_ppn_i             (m0_satp_ppn_q),
        .pte_is_leaf_o          (m1_pte_is_leaf),
        .req_next_level_pte_o   (m1_req_next_level_pte),
        .pte_req_address_o      (m1_ptw_req_addr_d),
        .page_fault_valid_o     (m1_page_fault_valid_invalid_pte)

    );

    leaf_pte_check #(
    .PTE_SIZE_IN_BIT(PTE_SIZE_IN_BIT)
    ) ptw_leaf (
        .access_mode_i          (m0_access_mode_q),
        .csr_sstatus_mxr_i      (m0_smxr_q),
        .csr_sstatus_sum_i      (m0_ssum_q),
        .priviledge_level_i     (m0_priviledge_level_q),
        .page_table_level_i     (m1_page_table_level),
        .pte_active_i           (m1_serve_ptw),
        .pte_i                  (m0_ptw_pte_q),
        .pte_is_leaf_i          (m1_pte_is_leaf),
        .pte_valid_o            (m1_pte_valid_leaf),
        .page_fault_valid_o     (m1_page_fault_valid_inaccessable_leaf_pte)
    );


    always @(posedge clk) begin : m0_lsu_valid_dff
        if (~rstn) begin
            m0_lsu_valid_q <= 1'b0;
            m0_lsu_active_q <= 1'b0;
        end else begin
            m0_lsu_valid_q <= m0_lsu_valid_d;
            m0_lsu_active_q <= m0_lsu_active_d;
        end
    end

    always @(posedge clk) begin : m0_lsu_payload_dff
        if (m0_lsu_clk_en) begin
            m0_priviledge_level_q      <= m0_priviledge_level_d;
            m0_mprv_q                  <= m0_mprv_d;
            m0_mpp_q                   <= m0_mpp_q;
            m0_smxr_q                  <= m0_smxr_d;
            m0_ssum_q                  <= m0_ssum_d;
            m0_satp_ppn_q              <= m0_satp_ppn_d;
            m0_satp_asid_q             <= m0_satp_asid_d;
            m0_satp_mode_q             <= m0_satp_mode_d;
            m0_virtual_address_q       <= m0_virtual_address_d;
            m0_access_mode_q           <= m0_access_mode_d;
            m0_init_page_table_level_q <= m0_init_page_table_level_d;
        end
    end

    always @(posedge clk) begin : m0_ptw_valid_dff
        if (~rstn) begin
            m0_ptw_valid_q <= 1'b0;
            m0_ptw_active_q <= 1'b0;
        end else begin
            m0_ptw_valid_q <= m0_ptw_valid_d;
            m0_ptw_active_q <= m0_ptw_active_d;
        end
    end

    always @(posedge clk) begin : m0_ptw_payload_dff
        if (m0_ptw_clk_en) begin
            m0_ptw_pte_q                <= m0_ptw_pte_d;
            m0_ptw_page_table_level_q   <= m0_ptw_page_table_level_d;
        end
    end

    always @(posedge clk) begin : m1_lsu_valid_dff
        if (~rstn) begin
            m1_lsu_valid_q <= 1'b0;
        end else begin
            m1_lsu_valid_q <= m1_lsu_valid_d;
        end
    end

    always @(posedge clk) begin : m1_lsu_payload_dff
        if (m1_lsu_clk_en) begin
            m1_lsu_resp_addr_q       <= m1_lsu_resp_addr_d;
            m1_page_fault_valid_q    <= m1_page_fault_valid_d;
            m1_page_fault_cause_q    <= m1_page_fault_cause_d;
        end
    end

    always @(posedge clk) begin : m1_ptw_valid_dff
        if (~rstn) begin
            m1_ptw_valid_q <= 1'b0;
        end else begin
            m1_ptw_valid_q <= m1_ptw_valid_d;
        end
    end

    always @(posedge clk) begin : m1_ptw_payload_dff
        if (m1_ptw_clk_en) begin
            m1_ptw_req_addr_q        <= m1_ptw_req_addr_d;
            m1_page_fault_valid_q    <= m1_page_fault_valid_d;
            m1_page_fault_cause_q    <= m1_page_fault_cause_d;
        end
    end

    // @TODO: TLB

endmodule : mmu_sv39



