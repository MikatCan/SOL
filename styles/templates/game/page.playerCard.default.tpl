{block name="title" prepend}{$LNG.lm_playercard}{/block}
{block name="content"}
<table style="width:95%">
	<tr>
		<th colspan="3">{$LNG.pl_overview}</th>
		</tr>
	<tr>
		<td style="width:40%">{$LNG.pl_name}</td>
		<td colspan="2">{$name}</td>
	</tr>
	<tr>
		<td>{$LNG.pl_homeplanet}</td>
		<td colspan="2">{$homeplanet} <a href="#" onclick="parent.location = 'game.php?page=galaxy&amp;galaxy={$galaxy}&amp;system={$system}';return false;">[{$galaxy}:{$system}:{$planet}]</a></td>
	</tr>
	<tr>
		<td>{$LNG.pl_ally}</td>
		<td colspan="2">{if $allyname}<a href="#" onclick="parent.location = 'game.php?page=alliance&amp;mode=info&amp;id={$allyid}';return false;">{$allyname}</a>{else}-{/if}</td>
	</tr>
        <tr>
            <th>{$LNG['lm_achievements']}</th>
            <th colspan="2">&nbsp;</th>
        </tr>
        <tr>
            <td>{$LNG['achievements_typ_mine']}</td>
            <td colspan="2">{if $mine != $mine_m}{$mine}/{$mine_m}{else}<span style="color:greenyellow;">ABGESCHLOSSEN</span>{/if}</td>
        </tr>
        <tr>
            <td>{$LNG['achievements_typ_research']}</td>
            <td colspan="2">{if $research !=$research_m}{$research}/{$research_m}{else}<span style="color:greenyellow;">ABGESCHLOSSEN</span>{/if}</td>
        </tr>
        <tr>
            <td>{$LNG['achievements_typ_battle']}</td>
            <td colspan="2">{if $battle !=$battle_m}{$battle}/{$battle_m}{else}<span style="color:greenyellow;">ABGESCHLOSSEN</span>{/if}</td>
        </tr>
        <tr>
            <td>{$LNG['achievements_typ_ship']}</td>
            <td colspan="2">{if $ship !=$ship_m}{$ship}/{$ship_m}{else}<span style="color:greenyellow;">ABGESCHLOSSEN</span>{/if}</td>
        </tr>
        <tr>
            <td>{$LNG['achievements_typ_defence']}</td>
            <td colspan="2">{if $defence !=$defence_m}{$defence}/{$defence_m}{else}<span style="color:greenyellow;">ABGESCHLOSSEN</span>{/if}</td>
        </tr>
        <tr>
            <td>{$LNG['achievements_typ_storage']}</td>
            <td colspan="2">{if $storage !=$storage_m}{$storage}/{$storage_m}{else}<span style="color:greenyellow;">ABGESCHLOSSEN</span>{/if}</td>
        </tr>
        <tr>
            <td>{$LNG['achievements_typ_moon']}</td>
            <td colspan="2">{if $moon !=$moon_m}{$moon}/{$moon_m}{else}<span style="color:greenyellow;">ABGESCHLOSSEN</span>{/if}</td>
        </tr>
        <tr>
            <td>{$LNG['achievements_typ_colony']}</td>
            <td colspan="2">{if $colony !=$colony_m}{$colony}/{$colony_m}{else}<span style="color:greenyellow;">ABGESCHLOSSEN</span>{/if}</td>
        </tr>
        <tr>
            <td>{$LNG['achievements_typ_friend']}</td>
            <td colspan="2">{if $friend !=$friend_m}{$friend}/{$friend_m}{else}<span style="color:greenyellow;">ABGESCHLOSSEN</span>{/if}</td>
        </tr>
        <tr>
            <td>{$LNG['achievements_typ_statpoints']}</td>
            <td colspan="2">{if $statpoints !=$statpoints_m}{$statpoints}/{$statpoints_m}{else}<span style="color:greenyellow;">ABGESCHLOSSEN</span>{/if}</td>
        </tr>
        <tr>
            <td>{$LNG['achievements_typ_destroy']}</td>
            <td colspan="2">{if $destroy !=$destroy_m}{$destroy}/{$destroy_m}{else}<span style="color:greenyellow;">ABGESCHLOSSEN</span>{/if}</td>
        </tr>
        <tr>
            <td>{$LNG['achievements_typ_debris']}</td>
            <td colspan="2">{if $debris !=$debris_m}{$debris}/{$debris_m}{else}<span style="color:greenyellow;">ABGESCHLOSSEN</span>{/if}</td>
        </tr>
	<tr>
		<th>&nbsp;</th>
		<th>{$LNG.pl_points}</th>
		<th>{$LNG.pl_range}</th>
	</tr>
	<tr>
		<td>{$LNG.pl_builds}</td>
		<td>{$build_points}</td>
		<td>{$build_rank}</td>
	</tr>
	<tr>
		<td>{$LNG.pl_tech}</td>
		<td>{$tech_points}</td>
		<td>{$tech_rank}</td>
	</tr>
	<tr>
		<td>{$LNG.pl_fleet}</td>
		<td>{$fleet_points}</td>
		<td>{$fleet_rank}</td>
	</tr>
	<tr>
		<td>{$LNG.pl_def}</td>
		<td>{$defs_points}</td>
		<td>{$defs_rank}</td>
	</tr>
	<tr>
		<td>{$LNG.pl_total}</td>
		<td>{$total_points}</td>
		<td>{$total_rank}</td>
	</tr>
	<tr>
		<th colspan="3">{$LNG.pl_fightstats}</th>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>{$LNG.pl_fights}</td>
		<td>{$LNG.pl_fprocent}</td>
	</tr>
	<tr>
		<td>{$LNG.pl_fightwon}</td>
		<td>{$wons}</td>
		<td>{$siegprozent} %</td>
	</tr>
	<tr>
		<td>{$LNG.pl_fightdraw}</td>
		<td>{$draws}</td>
		<td>{$drawsprozent} %</td>
	</tr>
	<tr>
		<td>{$LNG.pl_fightlose}</td>
		<td>{$loos}</td>
		<td>{$loosprozent} %</td>
	</tr>
	<tr>
		<td>{$LNG.pl_totalfight}</td>
		<td>{$totalfights}</td>
		<td>100 %</td>
	</tr>
	<tr>
		<th colspan="3">{$playerdestory}:</th>
	</tr>
	<tr>
		<td>{$LNG.pl_unitsshot}</td>
		<td colspan="2">{$desunits}</td>
	</tr>
	<tr>
		<td>{$LNG.pl_unitslose}</td>
		<td colspan="2">{$lostunits}</td>
	</tr>
	<tr>
		<td>{$LNG.pl_dermetal}</td>
		<td colspan="2">{$kbmetal}</td>
	</tr>
	<tr>
		<td>{$LNG.pl_dercrystal}</td>
		<td colspan="2">{$kbcrystal}</td>
	</tr>
{if $id != $yourid}
	<tr>
		<th colspan="3">{$LNG.pl_etc}</th>
	</tr>
	<tr>
		<td><a href="#" onclick="return Dialog.Buddy({$id})">{$LNG.pl_buddy}</a></td><td colspan="2"><a href="#" onclick="return Dialog.PM({$id});" title="{$LNG.pl_message}">{$LNG.pl_message}</a></td>
	</tr>
{/if}
</table>
{/block}