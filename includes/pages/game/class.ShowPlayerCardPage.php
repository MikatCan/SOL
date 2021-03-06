<?php

/**
 *  2Moons
 *  Copyright (C) 2012 Jan Kröpke
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * @package 2Moons
 * @author Jan Kröpke <info@2moons.cc>
 * @copyright 2012 Jan Kröpke <info@2moons.cc>
 * @license http://www.gnu.org/licenses/gpl.html GNU GPLv3 License
 * @version 1.7.3 (2013-05-19)
 * @info $Id: class.ShowPlayerCardPage.php 2632 2013-03-18 19:05:14Z slaver7 $
 * @link http://2moons.cc/
 */


class ShowPlayerCardPage extends AbstractPage
{
    public static $requireModule = MODULE_PLAYERCARD;
	
	protected $disableEcoSystem = true;

	function __construct() 
	{
		parent::__construct();
	}
	
	function show()
	{
		global $USER, $PLANET, $LNG, $UNI;
		
		$this->setWindow('popup');
		$this->initTemplate();
		
		$PlayerID 	= HTTP::_GP('id', 0);
			
		$query 		= $GLOBALS['DATABASE']->getFirstRow("SELECT 
						u.username, u.galaxy, u.system, u.planet, u.wons, u.loos, u.draws, u.kbmetal, u.kbcrystal, u.lostunits, u.desunits, u.ally_id, 
						p.name, 
						s.tech_rank, s.tech_points, s.build_rank, s.build_points, s.defs_rank, s.defs_points, s.fleet_rank, s.fleet_points, s.total_rank, s.total_points, 
						a.ally_name 
						FROM ".USERS." u 
						INNER JOIN ".PLANETS." p ON p.id = u.id_planet 
						LEFT JOIN ".STATPOINTS." s ON s.id_owner = u.id AND s.stat_type = 1 
						LEFT JOIN ".ALLIANCE." a ON a.id = u.ally_id
						WHERE u.id = ".$PlayerID." AND u.universe = ".$UNI.";");

		$totalfights = $query['wons'] + $query['loos'] + $query['draws'];
		
		if ($totalfights == 0) {
			$siegprozent                = 0;
			$loosprozent                = 0;
			$drawsprozent               = 0;
		} else {
			$siegprozent                = 100 / $totalfights * $query['wons'];
			$loosprozent                = 100 / $totalfights * $query['loos'];
			$drawsprozent               = 100 / $totalfights * $query['draws'];
		}
                
                $archivements = $GLOBALS['DATABASE']->query("SELECT * FROM uni1_users WHERE id= ".$PlayerID.";");
                
                $mine       = '';
                $research   = '';
                $battle     = '';
                $ship       = '';
                $defence    = '';
                $storage    = '';
                $moon       = '';
                $colony     = '';
                $friend     = '';
                $statpoints = '';
                $destroy    = '';
                $debris     = '';
                
                $mine_m       = '6';
                $research_m   = '6';
                $battle_m     = '6';
                $ship_m       = '6';
                $defence_m    = '6';
                $storage_m    = '4';
                $moon_m       = '4';
                $colony_m     = '6';
                $friend_m     = '3';
                $statpoints_m = '7';
                $destroy_m    = '7';
                $debris_m     = '6';
                
                foreach ($archivements as $erfolg){
                    $mine       = $erfolg['achievements_mine'];
                    $research   = $erfolg['achievements_research'];
                    $battle     = $erfolg['achievements_battle'];
                    $ship       = $erfolg['achievements_ship'];
                    $defence    = $erfolg['achievements_defence'];
                    $storage    = $erfolg['achievements_storage'];
                    $moon       = $erfolg['achievements_moon'];
                    $colony     = $erfolg['achievements_colony'];
                    $friend     = $erfolg['achievements_friend'];
                    $statpoints = $erfolg['achievements_statpoints'];
                    $destroy    = $erfolg['achievements_destroy'];
                    $debris     = $erfolg['achievements_debris'];
                    
                    
                }

		$this->tplObj->assign_vars(array(	
			'id'			=> $PlayerID,
			'yourid'		=> $USER['id'],
			'name'			=> $query['username'],
			'homeplanet'	=> $query['name'],
			'galaxy'		=> $query['galaxy'],
			'system'		=> $query['system'],
			'planet'		=> $query['planet'],
			'allyid'		=> $query['ally_id'],
                        'mine'                  => $mine,
                        'mine_m'                => $mine_m,
                        'research'              => $research,
                        'research_m'            => $research_m,
                        'battle'                => $battle,
                        'battle_m'              => $battle_m,
			'ship'                  => $ship,
                        'ship_m'                => $ship_m,
                        'defence'               => $defence,
                        'defence_m'             => $defence_m,
                        'storage'               => $storage,
                        'storage_m'             => $storage_m,
                        'moon'                  => $moon,
                        'moon_m'                => $moon_m,
                        'colony'                => $colony,
                        'colony_m'              => $colony_m,
                        'friend'                => $friend,
                        'friend_m'              => $friend_m,
                        'statpoints'            => $statpoints,
                        'statpoints_m'          => $statpoints_m,
                        'destroy'               => $destroy,
                        'destroy_m'             => $destroy_m,
                        'debris'                => $debris,
                        'debris_m'              => $debris_m,
                        'tech_rank'     => pretty_number($query['tech_rank']),
			'tech_points'   => pretty_number($query['tech_points']),
			'build_rank'    => pretty_number($query['build_rank']),
			'build_points'  => pretty_number($query['build_points']),
			'defs_rank'     => pretty_number($query['defs_rank']),
			'defs_points'   => pretty_number($query['defs_points']),
			'fleet_rank'    => pretty_number($query['fleet_rank']),
			'fleet_points'  => pretty_number($query['fleet_points']),
			'total_rank'    => pretty_number($query['total_rank']),
			'total_points'  => pretty_number($query['total_points']),
			'allyname'		=> $query['ally_name'],
			'playerdestory' => sprintf($LNG['pl_destroy'], $query['username']),
			'wons'          => pretty_number($query['wons']),
			'loos'          => pretty_number($query['loos']),
			'draws'         => pretty_number($query['draws']),
			'kbmetal'       => pretty_number($query['kbmetal']),
			'kbcrystal'     => pretty_number($query['kbcrystal']),
			'lostunits'     => pretty_number($query['lostunits']),
			'desunits'      => pretty_number($query['desunits']),
			'totalfights'   => pretty_number($totalfights),
			'siegprozent'   => round($siegprozent, 2),
			'loosprozent'   => round($loosprozent, 2),
			'drawsprozent'  => round($drawsprozent, 2),
		));
		
		$this->display('page.playerCard.default.tpl');
	}
}