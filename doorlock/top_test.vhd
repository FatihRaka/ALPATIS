--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:56:50 11/29/2022
-- Design Name:   
-- Module Name:   Z:/Downloads/doorlock/top_test.vhd
-- Project Name:  doorlock
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: top
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
 
ENTITY top_test IS
END top_test;
 
ARCHITECTURE behavior OF top_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top
    PORT(
         clock : IN  std_logic;
         reset : IN  std_logic;
         Switch : IN  std_logic_vector(3 downto 0);
         Button : IN  std_logic;
         ButtonPW : IN  std_logic;
         LED : OUT  std_logic_vector(3 downto 0);
         Lock : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';
   signal Switch : std_logic_vector(3 downto 0) := (others => '0');
   signal Button : std_logic := '0';
   signal ButtonPW : std_logic := '0';

 	--Outputs
   signal LED : std_logic_vector(3 downto 0);
   signal Lock : std_logic;

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top PORT MAP (
          clock => clock,
          reset => reset,
          Switch => Switch,
          Button => Button,
          ButtonPW => ButtonPW,
          LED => LED,
          Lock => Lock
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
	wait for 10 ns;
	ButtonPW<='1';
	wait for 10 ns;
	ButtonPW<='0';
	wait for 10 ns;
	Switch<="1100";
	Button<='1';
	wait for 10 ns;
	Button<='0';
	wait for 10 ns;
	Button<='1';
	wait for 10 ns;
	Button<='0';
	Switch<="0000";
	wait for 10 ns;
	ButtonPW<='1';
	wait for 10 ns;
	ButtonPW<='0';
	wait for 10 ns;
	Button<='1';
	wait for 10 ns;
	Button<='0';
	Switch<="1100";
	wait for 10 ns;
	Button<='1';
	wait for 10 ns;
	Button<='0';
	Switch<="0000";
	wait for 10 ns;
	Button<='1';
	wait for 10 ns;
	Button<='0';
	wait for 10 ns;
	ButtonPW<='1';
	wait for 10 ns;
	ButtonPW<='0';
	wait for 10 ns;
	Switch<="0000";
	Button<='1';
	wait for 10 ns;
	Button<='0';
	wait for 10 ns;
	Button<='1';
	wait for 10 ns;
	Button<='0';
	Switch<="0001";
	wait for 10 ns;
	ButtonPW<='1';
	wait for 10 ns;
	ButtonPW<='0';
	wait for 10 ns;
	Button<='1';
	wait for 10 ns;
	Button<='0';
	Switch<="0000";
	wait for 10 ns;
	Button<='1';
	wait for 10 ns;
	Button<='0';
	
	
	
	
	
	
	
	
		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clock_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
