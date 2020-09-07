use serde::{de, Deserialize};
use std::fs::File;
use std::io::BufReader;
use std::path::PathBuf;
use structopt::StructOpt;
use mustache::MapBuilder;

#[derive(Debug, StructOpt)]
#[structopt(name = "colors", about = "Base-16 colors + some")]
struct Opt {
    /// Scheme file
    #[structopt(parse(from_os_str))]
    scheme: PathBuf,

    /// Template file
    #[structopt(parse(from_os_str))]
    template: PathBuf,
}

#[derive(Debug)]
struct Color {
    r: u8,
    g: u8,
    b: u8,
}

impl Color {
    fn rgb_r(&self) -> String {
        format!("{}", self.r)
    }
    fn rgb_g(&self) -> String {
        format!("{}", self.g)
    }
    fn rgb_b(&self) -> String {
        format!("{}", self.b)
    }
    fn hex_r(&self) -> String {
        format!("{:02x}", self.r)
    }
    fn hex_g(&self) -> String {
        format!("{:02x}", self.g)
    }
    fn hex_b(&self) -> String {
        format!("{:02x}", self.b)
    }
    fn dec_r(&self) -> String {
        format!("{}", self.r as f64 / 255.)
    }
    fn dec_g(&self) -> String {
        format!("{}", self.g as f64 / 255.)
    }
    fn dec_b(&self) -> String {
        format!("{}", self.b as f64 / 255.)
    }
    fn hex(&self) -> String {
        format!("{:02x}{:02x}{:02x}", self.r, self.g, self.b)
    }
}

impl<'de> Deserialize<'de> for Color {
    fn deserialize<D>(deserializer: D) -> Result<Color, D::Error>
    where
        D: de::Deserializer<'de>,
    {
        let s: String = Deserialize::deserialize(deserializer)?;
        let without_prefix = s.trim_start_matches("#");
        if without_prefix.len() != 6 {
            return Err(de::Error::custom(format!("Color must be 6 characters")));
        }
        let err = |x| match x {
            Ok(res) => Ok(res),
            Err(e) => Err(de::Error::custom(format!(
                "Failed to deserialize color: {}",
                e
            ))),
        };
        let r = err(u8::from_str_radix(&without_prefix[0..2], 16))?;
        let g = err(u8::from_str_radix(&without_prefix[2..4], 16))?;
        let b = err(u8::from_str_radix(&without_prefix[4..6], 16))?;
        Ok(Color { r, g, b })
    }
}

#[derive(Debug, Deserialize)]
struct Colors {
    scheme: String,
    author: String,
    #[serde(alias = "color00", alias = "black")]
    base00: Color,
    #[serde(alias = "color01", alias = "red")]
    base01: Color,
    #[serde(alias = "color02", alias = "green")]
    base02: Color,
    #[serde(alias = "color03", alias = "yellow")]
    base03: Color,
    #[serde(alias = "color04", alias = "blue")]
    base04: Color,
    #[serde(alias = "color05", alias = "magenta")]
    base05: Color,
    #[serde(alias = "color06", alias = "cyan")]
    base06: Color,
    #[serde(alias = "color07", alias = "white")]
    base07: Color,
    #[serde(alias = "color08", alias = "blackb")]
    base08: Color,
    #[serde(alias = "color09", alias = "redb")]
    base09: Color,
    #[serde(alias = "base0A", alias = "color10", alias = "greenb")]
    base0a: Color,
    #[serde(alias = "base0B", alias = "color11", alias = "yellowb")]
    base0b: Color,
    #[serde(alias = "base0C", alias = "color12", alias = "blueb")]
    base0c: Color,
    #[serde(alias = "base0D", alias = "color13", alias = "magentab")]
    base0d: Color,
    #[serde(alias = "base0E", alias = "color14", alias = "cyanb")]
    base0e: Color,
    #[serde(alias = "base0F", alias = "color15", alias = "whiteb")]
    base0f: Color,
    #[serde(alias = "colorfg")]
    foreground: Color,
    #[serde(alias = "colorbg")]
    background: Color,
}

fn build_map(colors: &Colors) -> mustache::Data {
    MapBuilder::new()
        .insert_str("scheme-author", colors.author.clone())
        .insert_str("scheme-name", colors.scheme.clone())
        .insert_str("scheme-slug", colors.scheme.clone())
        // rgb
        .insert_str("base00-rgb-r", colors.base00.rgb_r())
        .insert_str("base00-rgb-g", colors.base00.rgb_g())
        .insert_str("base00-rgb-b", colors.base00.rgb_b())
        .insert_str("base01-rgb-r", colors.base01.rgb_r())
        .insert_str("base01-rgb-g", colors.base01.rgb_g())
        .insert_str("base01-rgb-b", colors.base01.rgb_b())
        .insert_str("base02-rgb-r", colors.base02.rgb_r())
        .insert_str("base02-rgb-g", colors.base02.rgb_g())
        .insert_str("base02-rgb-b", colors.base02.rgb_b())
        .insert_str("base03-rgb-r", colors.base03.rgb_r())
        .insert_str("base03-rgb-g", colors.base03.rgb_g())
        .insert_str("base03-rgb-b", colors.base03.rgb_b())
        .insert_str("base04-rgb-r", colors.base04.rgb_r())
        .insert_str("base04-rgb-g", colors.base04.rgb_g())
        .insert_str("base04-rgb-b", colors.base04.rgb_b())
        .insert_str("base05-rgb-r", colors.base05.rgb_r())
        .insert_str("base05-rgb-g", colors.base05.rgb_g())
        .insert_str("base05-rgb-b", colors.base05.rgb_b())
        .insert_str("base06-rgb-r", colors.base06.rgb_r())
        .insert_str("base06-rgb-g", colors.base06.rgb_g())
        .insert_str("base06-rgb-b", colors.base06.rgb_b())
        .insert_str("base07-rgb-r", colors.base07.rgb_r())
        .insert_str("base07-rgb-g", colors.base07.rgb_g())
        .insert_str("base07-rgb-b", colors.base07.rgb_b())
        .insert_str("base08-rgb-r", colors.base08.rgb_r())
        .insert_str("base08-rgb-g", colors.base08.rgb_g())
        .insert_str("base08-rgb-b", colors.base08.rgb_b())
        .insert_str("base09-rgb-r", colors.base09.rgb_r())
        .insert_str("base09-rgb-g", colors.base09.rgb_g())
        .insert_str("base09-rgb-b", colors.base09.rgb_b())
        .insert_str("base0A-rgb-r", colors.base0a.rgb_r())
        .insert_str("base0A-rgb-g", colors.base0a.rgb_g())
        .insert_str("base0A-rgb-b", colors.base0a.rgb_b())
        .insert_str("base0B-rgb-r", colors.base0b.rgb_r())
        .insert_str("base0B-rgb-g", colors.base0b.rgb_g())
        .insert_str("base0B-rgb-b", colors.base0b.rgb_b())
        .insert_str("base0C-rgb-r", colors.base0c.rgb_r())
        .insert_str("base0C-rgb-g", colors.base0c.rgb_g())
        .insert_str("base0C-rgb-b", colors.base0c.rgb_b())
        .insert_str("base0D-rgb-r", colors.base0d.rgb_r())
        .insert_str("base0D-rgb-g", colors.base0d.rgb_g())
        .insert_str("base0D-rgb-b", colors.base0d.rgb_b())
        .insert_str("base0E-rgb-r", colors.base0e.rgb_r())
        .insert_str("base0E-rgb-g", colors.base0e.rgb_g())
        .insert_str("base0E-rgb-b", colors.base0e.rgb_b())
        .insert_str("base0F-rgb-r", colors.base0f.rgb_r())
        .insert_str("base0F-rgb-g", colors.base0f.rgb_g())
        .insert_str("base0F-rgb-b", colors.base0f.rgb_b())
        .insert_str("foreground-rgb-r", colors.foreground.rgb_r())
        .insert_str("foreground-rgb-g", colors.foreground.rgb_g())
        .insert_str("foreground-rgb-b", colors.foreground.rgb_b())
        .insert_str("background-rgb-r", colors.background.rgb_r())
        .insert_str("background-rgb-g", colors.background.rgb_g())
        .insert_str("background-rgb-b", colors.background.rgb_b())
        // hex
        .insert_str("base00-hex-r", colors.base00.hex_r())
        .insert_str("base00-hex-g", colors.base00.hex_g())
        .insert_str("base00-hex-b", colors.base00.hex_b())
        .insert_str("base01-hex-r", colors.base01.hex_r())
        .insert_str("base01-hex-g", colors.base01.hex_g())
        .insert_str("base01-hex-b", colors.base01.hex_b())
        .insert_str("base02-hex-r", colors.base02.hex_r())
        .insert_str("base02-hex-g", colors.base02.hex_g())
        .insert_str("base02-hex-b", colors.base02.hex_b())
        .insert_str("base03-hex-r", colors.base03.hex_r())
        .insert_str("base03-hex-g", colors.base03.hex_g())
        .insert_str("base03-hex-b", colors.base03.hex_b())
        .insert_str("base04-hex-r", colors.base04.hex_r())
        .insert_str("base04-hex-g", colors.base04.hex_g())
        .insert_str("base04-hex-b", colors.base04.hex_b())
        .insert_str("base05-hex-r", colors.base05.hex_r())
        .insert_str("base05-hex-g", colors.base05.hex_g())
        .insert_str("base05-hex-b", colors.base05.hex_b())
        .insert_str("base06-hex-r", colors.base06.hex_r())
        .insert_str("base06-hex-g", colors.base06.hex_g())
        .insert_str("base06-hex-b", colors.base06.hex_b())
        .insert_str("base07-hex-r", colors.base07.hex_r())
        .insert_str("base07-hex-g", colors.base07.hex_g())
        .insert_str("base07-hex-b", colors.base07.hex_b())
        .insert_str("base08-hex-r", colors.base08.hex_r())
        .insert_str("base08-hex-g", colors.base08.hex_g())
        .insert_str("base08-hex-b", colors.base08.hex_b())
        .insert_str("base09-hex-r", colors.base09.hex_r())
        .insert_str("base09-hex-g", colors.base09.hex_g())
        .insert_str("base09-hex-b", colors.base09.hex_b())
        .insert_str("base0A-hex-r", colors.base0a.hex_r())
        .insert_str("base0A-hex-g", colors.base0a.hex_g())
        .insert_str("base0A-hex-b", colors.base0a.hex_b())
        .insert_str("base0B-hex-r", colors.base0b.hex_r())
        .insert_str("base0B-hex-g", colors.base0b.hex_g())
        .insert_str("base0B-hex-b", colors.base0b.hex_b())
        .insert_str("base0C-hex-r", colors.base0c.hex_r())
        .insert_str("base0C-hex-g", colors.base0c.hex_g())
        .insert_str("base0C-hex-b", colors.base0c.hex_b())
        .insert_str("base0D-hex-r", colors.base0d.hex_r())
        .insert_str("base0D-hex-g", colors.base0d.hex_g())
        .insert_str("base0D-hex-b", colors.base0d.hex_b())
        .insert_str("base0E-hex-r", colors.base0e.hex_r())
        .insert_str("base0E-hex-g", colors.base0e.hex_g())
        .insert_str("base0E-hex-b", colors.base0e.hex_b())
        .insert_str("base0F-hex-r", colors.base0f.hex_r())
        .insert_str("base0F-hex-g", colors.base0f.hex_g())
        .insert_str("base0F-hex-b", colors.base0f.hex_b())
        .insert_str("foreground-hex-r", colors.foreground.hex_r())
        .insert_str("foreground-hex-g", colors.foreground.hex_g())
        .insert_str("foreground-hex-b", colors.foreground.hex_b())
        .insert_str("background-hex-r", colors.background.hex_r())
        .insert_str("background-hex-g", colors.background.hex_g())
        .insert_str("background-hex-b", colors.background.hex_b())
        // decimal
        .insert_str("base00-dec-r", colors.base00.dec_r())
        .insert_str("base00-dec-g", colors.base00.dec_g())
        .insert_str("base00-dec-b", colors.base00.dec_b())
        .insert_str("base01-dec-r", colors.base01.dec_r())
        .insert_str("base01-dec-g", colors.base01.dec_g())
        .insert_str("base01-dec-b", colors.base01.dec_b())
        .insert_str("base02-dec-r", colors.base02.dec_r())
        .insert_str("base02-dec-g", colors.base02.dec_g())
        .insert_str("base02-dec-b", colors.base02.dec_b())
        .insert_str("base03-dec-r", colors.base03.dec_r())
        .insert_str("base03-dec-g", colors.base03.dec_g())
        .insert_str("base03-dec-b", colors.base03.dec_b())
        .insert_str("base04-dec-r", colors.base04.dec_r())
        .insert_str("base04-dec-g", colors.base04.dec_g())
        .insert_str("base04-dec-b", colors.base04.dec_b())
        .insert_str("base05-dec-r", colors.base05.dec_r())
        .insert_str("base05-dec-g", colors.base05.dec_g())
        .insert_str("base05-dec-b", colors.base05.dec_b())
        .insert_str("base06-dec-r", colors.base06.dec_r())
        .insert_str("base06-dec-g", colors.base06.dec_g())
        .insert_str("base06-dec-b", colors.base06.dec_b())
        .insert_str("base07-dec-r", colors.base07.dec_r())
        .insert_str("base07-dec-g", colors.base07.dec_g())
        .insert_str("base07-dec-b", colors.base07.dec_b())
        .insert_str("base08-dec-r", colors.base08.dec_r())
        .insert_str("base08-dec-g", colors.base08.dec_g())
        .insert_str("base08-dec-b", colors.base08.dec_b())
        .insert_str("base09-dec-r", colors.base09.dec_r())
        .insert_str("base09-dec-g", colors.base09.dec_g())
        .insert_str("base09-dec-b", colors.base09.dec_b())
        .insert_str("base0A-dec-r", colors.base0a.dec_r())
        .insert_str("base0A-dec-g", colors.base0a.dec_g())
        .insert_str("base0A-dec-b", colors.base0a.dec_b())
        .insert_str("base0B-dec-r", colors.base0b.dec_r())
        .insert_str("base0B-dec-g", colors.base0b.dec_g())
        .insert_str("base0B-dec-b", colors.base0b.dec_b())
        .insert_str("base0C-dec-r", colors.base0c.dec_r())
        .insert_str("base0C-dec-g", colors.base0c.dec_g())
        .insert_str("base0C-dec-b", colors.base0c.dec_b())
        .insert_str("base0D-dec-r", colors.base0d.dec_r())
        .insert_str("base0D-dec-g", colors.base0d.dec_g())
        .insert_str("base0D-dec-b", colors.base0d.dec_b())
        .insert_str("base0E-dec-r", colors.base0e.dec_r())
        .insert_str("base0E-dec-g", colors.base0e.dec_g())
        .insert_str("base0E-dec-b", colors.base0e.dec_b())
        .insert_str("base0F-dec-r", colors.base0f.dec_r())
        .insert_str("base0F-dec-g", colors.base0f.dec_g())
        .insert_str("base0F-dec-b", colors.base0f.dec_b())
        .insert_str("foreground-dec-r", colors.foreground.dec_r())
        .insert_str("foreground-dec-g", colors.foreground.dec_g())
        .insert_str("foreground-dec-b", colors.foreground.dec_b())
        .insert_str("background-dec-r", colors.background.dec_r())
        .insert_str("background-dec-g", colors.background.dec_g())
        .insert_str("background-dec-b", colors.background.dec_b())
        // full hex
        .insert_str("base00-hex", colors.base00.hex())
        .insert_str("base01-hex", colors.base01.hex())
        .insert_str("base02-hex", colors.base02.hex())
        .insert_str("base03-hex", colors.base03.hex())
        .insert_str("base04-hex", colors.base04.hex())
        .insert_str("base05-hex", colors.base05.hex())
        .insert_str("base06-hex", colors.base06.hex())
        .insert_str("base07-hex", colors.base07.hex())
        .insert_str("base08-hex", colors.base08.hex())
        .insert_str("base09-hex", colors.base09.hex())
        .insert_str("base0A-hex", colors.base0a.hex())
        .insert_str("base0B-hex", colors.base0b.hex())
        .insert_str("base0C-hex", colors.base0c.hex())
        .insert_str("base0D-hex", colors.base0d.hex())
        .insert_str("base0E-hex", colors.base0e.hex())
        .insert_str("base0F-hex", colors.base0f.hex())
        .insert_str("foreground-hex", colors.foreground.hex())
        .insert_str("background-hex", colors.background.hex())
        .build()
}

fn main() -> Result<(), Box<dyn std::error::Error>> {
    let opt = Opt::from_args();

    let template = mustache::compile_path(opt.template)?;

    let file = File::open(opt.scheme)?;
    let reader = BufReader::new(file);
    let colors: Colors = serde_yaml::from_reader(reader)?;

    println!("{}",template.render_data_to_string(&build_map(&colors))?);
    Ok(())
}
