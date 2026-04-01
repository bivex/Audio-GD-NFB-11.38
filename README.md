# Audio-GD NFB-11.38 Optimization

A collection of Windows registry files and batch scripts for optimizing system settings to enhance audio quality for audiophile setups, including specific DACs and headphones.

## Supported Hardware

- Audio-GD NFB-11.38
- Topping E30 II DAC
- Marshall Stanmore
- Sennheiser HD660S

## Files

| File | Description |
|------|-------------|
| `audiophile_optimization_win10_enhanced.reg` | Base Windows 10 audio optimization |
| `audiophile_optimization_win10_enhanced_pos.reg` | Position-based optimization variant |
| `audiophile_optimization_win10_enhanced_pos2.reg` | Alternative position optimization |
| `audiophile_optimization_win10_enhanced_nofantast.reg` | Conservative optimization without fantasy tweaks |
| `TOPPING E30 II DAC + MARSHALL STANMORE.reg` | Topping E30 II + Marshall Stanmore profile |
| `hd660s_optimization.reg` | Sennheiser HD660S specific tuning |
| `registry_backup.bat` | Backup current registry settings |

## Usage

1. **Back up your registry** first:
   ```batch
   registry_backup.bat
   ```

2. Apply the desired `.reg` file by double-clicking it or running:
   ```batch
   reg import audiophile_optimization_win10_enhanced.reg
   ```

3. Restart your system for changes to take effect.

## Topping E30 II

See [Topping manual.md](Topping%20manual.md) for hardware-specific documentation.

## Warning

Registry modifications can affect system stability. Always back up before applying changes.

## License

See [LICENSE](LICENSE) for details.
