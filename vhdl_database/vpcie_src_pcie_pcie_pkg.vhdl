library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


package pcie is

constant ADDR_WIDTH: natural := 64;
constant DATA_WIDTH: natural := 64;
constant SIZE_WIDTH: natural := 16;
constant BAR_WIDTH: natural := 3;
constant PAYLOAD_WIDTH: natural := 1024;

component endpoint is
 port
 (
  rst: in std_ulogic;
  clk: in std_ulogic;

  req_en: out std_ulogic;
  req_ack: in std_ulogic;
  req_wr: out std_ulogic;
  req_bar: out std_ulogic_vector(BAR_WIDTH - 1 downto 0);
  req_addr: out std_ulogic_vector(ADDR_WIDTH - 1 downto 0);
  req_data: out std_ulogic_vector(DATA_WIDTH - 1 downto 0);

  rep_en: in std_ulogic;
  rep_data: in std_ulogic_vector(DATA_WIDTH - 1 downto 0);

  mwr_en: in std_ulogic;
  mwr_addr: in std_ulogic_vector(ADDR_WIDTH - 1 downto 0);
  mwr_data: in std_ulogic_vector(PAYLOAD_WIDTH - 1 downto 0);
  mwr_size: in std_ulogic_vector(SIZE_WIDTH - 1 downto 0);

  msi_en: in std_ulogic
 );
end component endpoint;

-- C externally implemented routines

procedure glue_poll_rx_fifo
(
 is_read: out unsigned(7 downto 0);
 bar: out unsigned(7 downto 0);
 addr: out unsigned(63 downto 0);
 data: out unsigned(63 downto 0);
 size: out unsigned(15 downto 0)
);
attribute foreign of glue_poll_rx_fifo:
 procedure is "VHPIDIRECT pcie_glue_poll_rx_fifo";

procedure glue_send_reply
(
 data: in unsigned(63 downto 0)
);
attribute foreign of glue_send_reply:
 procedure is "VHPIDIRECT pcie_glue_send_reply";

procedure glue_send_msi;
attribute foreign of glue_send_msi:
 procedure is "VHPIDIRECT pcie_glue_send_msi";

procedure glue_send_write
(
 addr: in unsigned(63 downto 0);
 data: in unsigned(pcie.PAYLOAD_WIDTH - 1 downto 0);
 data_size: in unsigned(15 downto 0);
 size: in unsigned(15 downto 0)
);
attribute foreign of glue_send_write:
 procedure is "VHPIDIRECT pcie_glue_send_write";

type glue_buf_t is array(0 to 1023) of unsigned(7 downto 0);

procedure glue_send_write_buf
(
 addr: in unsigned(63 downto 0);
 buf: in glue_buf_t;
 size: in unsigned(15 downto 0)
);
attribute foreign of glue_send_write_buf:
 procedure is "VHPIDIRECT pcie_glue_send_write_buf";

end package pcie;


package body pcie is

-- dummy implementation for externally defined routines is required

procedure glue_poll_rx_fifo
(
 is_read: out unsigned(7 downto 0);
 bar: out unsigned(7 downto 0);
 addr: out unsigned(63 downto 0);
 data: out unsigned(63 downto 0);
 size: out unsigned(15 downto 0)
)
is begin
 assert false report "VHPI" severity failure;
end glue_poll_rx_fifo;

procedure glue_send_reply
(
 data: in unsigned(63 downto 0)
)
is begin
 assert false report "VHPI" severity failure;
end glue_send_reply;

procedure glue_send_msi
is begin
 assert false report "VHPI" severity failure;
end glue_send_msi;

procedure glue_send_write
(
 addr: in unsigned(63 downto 0);
 data: in unsigned(pcie.PAYLOAD_WIDTH - 1 downto 0);
 data_size: in unsigned(15 downto 0);
 size: in unsigned(15 downto 0)
)
is begin
 assert false report "VHPI" severity failure;
end glue_send_write;

procedure glue_send_write_buf
(
 addr: in unsigned(63 downto 0);
 buf: in pcie.glue_buf_t;
 size: in unsigned(15 downto 0)
)
is begin
 assert false report "VHPI" severity failure;
end glue_send_write_buf;

end pcie; -- end package body
