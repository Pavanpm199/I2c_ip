library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Sys_top_tb is
end;

architecture bench of Sys_top_tb is

  component Sys_top
  	port (
  	  clk_p                 : in  std_logic;  
  	  rst_in                : in  std_logic; 
      proc_beat			    : out std_logic; 
      sin0		            : in std_logic;  
      sout0                 : out std_logic;
      sin1		            : in std_logic;  
      sout1                 : out std_logic;
      
      scl                   : inout std_logic;
      sda                   : inout std_logic
      );
  end component;

  signal clk_p    : std_logic := '1';
  signal rst_in   : std_logic := '0';
  signal proc_beat: std_logic;
  signal sin0     : std_logic;
  signal sout0    : std_logic ;
  signal sin1     : std_logic;
  signal sout1    : std_logic ;
  signal scl      : std_logic ;
  signal sda      : std_logic;  


begin

  uut: Sys_top port map ( clk_p     => clk_p,
                          rst_in    => rst_in,
                          proc_beat => proc_beat,
                          sin0      => sin0,
                          sout0     => sout0,
                          sin1      => sin1,
                          sout1     => sout1,
                          scl       => scl,
                          sda       => sda
                        );

  stimulus: process(clk_p)
  begin
    
clk_p <= not clk_p after 2.5 ns;

  end process;
  rst_in <= '1' after 200 ns;

end;