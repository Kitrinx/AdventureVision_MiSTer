-------------------------------------------------------------------------------
--
-- $Id: t48_core_comp_pack-p.vhd,v 1.3 2005/11/01 21:33:41 arniml Exp $
--
-- Copyright (c) 2004, Arnim Laeuger (arniml@opencores.org)
--
-- All rights reserved
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

package t48_core_comp_pack is

  component t48_core
    generic (
      xtal_div_3_g          : integer := 1;
      register_mnemonic_g   : integer := 1;
      include_port1_g       : integer := 1;
      include_port2_g       : integer := 1;
      include_bus_g         : integer := 1;
      include_timer_g       : integer := 1;
      sample_t1_state_g     : integer := 4
    );

    port (
      xtal_i        : in  std_logic;
      reset_i       : in  std_logic;
      t0_i          : in  std_logic;
      t0_o          : out std_logic;
      t0_dir_o      : out std_logic;
      int_n_i       : in  std_logic;
      ea_i          : in  std_logic;
      rd_n_o        : out std_logic;
      psen_n_o      : out std_logic;
      wr_n_o        : out std_logic;
      ale_o         : out std_logic;
      db_i          : in  std_logic_vector( 7 downto 0);
      db_o          : out std_logic_vector( 7 downto 0);
      db_dir_o      : out std_logic;
      t1_i          : in  std_logic;
      p2_i          : in  std_logic_vector( 7 downto 0);
      p2_o          : out std_logic_vector( 7 downto 0);
      p2l_low_imp_o : out std_logic;
      p2h_low_imp_o : out std_logic;
      p1_i          : in  std_logic_vector( 7 downto 0);
      p1_o          : out std_logic_vector( 7 downto 0);
      p1_low_imp_o  : out std_logic;
      prog_n_o      : out std_logic;
      clk_i         : in  std_logic;
      en_clk_i      : in  std_logic;
      xtal3_o       : out std_logic;
      dmem_addr_o   : out std_logic_vector( 7 downto 0);
      dmem_we_o     : out std_logic;
      dmem_data_i   : in  std_logic_vector( 7 downto 0);
      dmem_data_o   : out std_logic_vector( 7 downto 0);
      pmem_addr_o   : out std_logic_vector(11 downto 0);
      pmem_data_i   : in  std_logic_vector( 7 downto 0)
    );
  end component;

  component syn_rom
    generic (
      address_width_g : positive := 10
    );
    port (
      clk_i      : in  std_logic;
      rom_addr_i : in  std_logic_vector(address_width_g-1 downto 0);
      rom_data_o : out std_logic_vector(7 downto 0)
    );
  end component;

  component syn_ram
    generic (
      address_width_g : positive := 8
    );
    port (
      clk_i      : in  std_logic;
      res_i      : in  std_logic;
      ram_addr_i : in  std_logic_vector(address_width_g-1 downto 0);
      ram_data_i : in  std_logic_vector(7 downto 0);
      ram_we_i   : in  std_logic;
      ram_data_o : out std_logic_vector(7 downto 0)
    );
  end component;

end t48_core_comp_pack;
