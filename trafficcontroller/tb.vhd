--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:04:26 11/11/2015
-- Design Name:   
-- Module Name:   C:/Users/Ghost/Documents/Xilinx_Workspaces/trafficcontroller/tb.vhd
-- Project Name:  trafficcontroller
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: TRAFFICWITHOUTSENSOR
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb IS
END tb;
 
ARCHITECTURE behavior OF tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT TRAFFICWITHOUTSENSOR
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         e_red : OUT  std_logic;
         e_yellow : OUT  std_logic;
         e_green : OUT  std_logic;
         w_red : OUT  std_logic;
         w_yellow : OUT  std_logic;
         w_green : OUT  std_logic;
         n_red : OUT  std_logic;
         n_yellow : OUT  std_logic;
         n_green : OUT  std_logic;
         s_red : OUT  std_logic;
         s_yellow : OUT  std_logic;
         s_green : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal e_red : std_logic;
   signal e_yellow : std_logic;
   signal e_green : std_logic;
   signal w_red : std_logic;
   signal w_yellow : std_logic;
   signal w_green : std_logic;
   signal n_red : std_logic;
   signal n_yellow : std_logic;
   signal n_green : std_logic;
   signal s_red : std_logic;
   signal s_yellow : std_logic;
   signal s_green : std_logic;

   -- Clock period definitions
   constant clk_period : time := 2 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TRAFFICWITHOUTSENSOR PORT MAP (
          clk => clk,
          reset => reset,
          e_red => e_red,
          e_yellow => e_yellow,
          e_green => e_green,
          w_red => w_red,
          w_yellow => w_yellow,
          w_green => w_green,
          n_red => n_red,
          n_yellow => n_yellow,
          n_green => n_green,
          s_red => s_red,
          s_yellow => s_yellow,
          s_green => s_green
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
   
      wait for clk_period*10;
     
		
      -- insert stimulus here 
	
     -- wait;
   end process;

END;
