" Change the color scheme from a list of color scheme names.
" Version 2010-09-12 from http://vim.wikia.com/wiki/VimTip341
" Press key:
"   F8                next scheme
"   Shift-F8          previous scheme
"   Alt-F8            random scheme
" Set the list of color schemes used by the above (default is 'all'):
"   :SetColors all              (all $VIMRUNTIME/colors/*.vim)
"   :SetColors my               (names built into script)
"   :SetColors blue slate ron   (these schemes)
"   :SetColors                  (display current scheme names)
" Set the current color scheme based on time of day:
"   :SetColors now
if v:version < 700 || exists('loaded_setcolors') || &cp
  finish
endif

let loaded_setcolors = 1
let s:mycolors = ['256-grayvim', '256-jungle', 'Benokai', 'Chasing_Logic', 'Monokai', 'MountainDew', 'OceanicNext', 'Revolution', 'SerialExperimentsLain', 'Tomorrow-Night-Eighties', 'abra', 'abyss', 'adam', 'adaryn', 'adobe', 'adrian', 'advantage', 'adventurous', 'af', 'afterglow', 'aiseered', 'alduin', 'ancient', 'anderson', 'angr', 'anotherdark', 'ansi_blows', 'antares', 'apprentice', 'aqua', 'aquamarine', 'arcadia', 'archery', 'argonaut', 'ashen', 'asmanian2', 'asmanian_blood', 'asmdev', 'asmdev2', 'astronaut', 'asu1dark', 'atom', 'aurora', 'automation', 'autumn', 'autumnleaf', 'ayu', 'babymate256', 'badwolf', 'bandit', 'base', 'base16-ateliercave', 'base16-atelierdune', 'base16-atelierestuary', 'base16-atelierforest', 'base16-atelierheath', 'base16-atelierlakeside', 'base16-atelierplateau', 'base16-ateliersavanna', 'base16-atelierseaside', 'base16-ateliersulphurpool', 'base16-railscasts', 'basic-dark', 'basic-light', 'basic', 'bayQua', 'baycomb', 'bclear', 'beachcomber', 'beauty256', 'beekai', 'behelit', 'benlight', 'bensday', 'billw', 'biogoo', 'birds-of-paradise', 'bitterjug', 'black_angus', 'blackbeauty', 'blackboard', 'blackdust', 'blacklight', 'blaquemagick', 'blazer', 'blink', 'blue', 'bluechia', 'bluedrake', 'bluegreen', 'bluenes', 'blueprint', 'blues', 'blueshift', 'bluez', 'blugrine', 'bluish', 'bmichaelsen', 'boa', 'bocau', 'bog', 'boltzmann', 'borland', 'breeze', 'breezy', 'brighton', 'briofita', 'broduo', 'brogrammer', 'brookstream', 'brown', 'bubblegum-256-dark', 'bubblegum-256-light', 'bubblegum', 'buddy', 'burnttoast256', 'busierbee', 'busybee', 'buttercream', 'bvemu', 'bw', 'c', 'c16gui', 'cabin', 'cake', 'cake16', 'calmar256-dark', 'calmar256-light', 'camo', 'campfire', 'candy', 'candycode', 'candyman', 'caramel', 'carrot', 'carvedwood', 'carvedwoodcool', 'cascadia', 'celtics_away', 'cgpro', 'chalkboard', 'chance-of-storm', 'charged-256', 'charon', 'chela_light', 'cherryblossom', 'chlordane', 'chocolate', 'chroma', 'chrysoprase', 'clarity', 'cleanphp', 'cleanroom', 'clearance', 'cloudy', 'clue', 'cobalt', 'cobalt2', 'cobaltish', 'coda', 'codeblocks_dark', 'codeburn', 'codedark', 'codeschool', 'coffee', 'coldgreen', 'colorer', 'colorful', 'colorful256', 'colorsbox-faff', 'colorsbox-greenish', 'colorsbox-material', 'colorsbox-stblue', 'colorsbox-stbright', 'colorsbox-steighties', 'colorsbox-stnight', 'colorzone', 'contrastneed', 'contrasty', 'cool', 'corn', 'corporation', 'crayon', 'crt', 'crunchbang', 'cthulhian', 'custom', 'cyberpunk', 'd8g_01', 'd8g_02', 'd8g_03', 'd8g_04', 'dante', 'dark-ruby', 'darkBlue', 'darkZ', 'darkblack', 'darkblue', 'darkblue2', 'darkbone', 'darkburn', 'darkdevel', 'darkdot', 'darkeclipse', 'darker-robin', 'darkerdesert', 'darkglass', 'darkocean', 'darkrobot', 'darkslategray', 'darkspectrum', 'darktango', 'darkzen', 'darth', 'dawn', 'deep-space', 'deepsea', 'default', 'delek', 'delphi', 'denim', 'derefined', 'desert', 'desert256', 'desert256v2', 'desertEx', 'desertedocean', 'desertedoceanburnt', 'desertink', 'despacio', 'detailed', 'deus', 'devbox-dark-256', 'deveiate', 'developer', 'diokai', 'disciple', 'distill', 'distinguished', 'django', 'donbass', 'donttouchme', 'doorhinge', 'doriath', 'dracula', 'dracula_bold', 'dual', 'dull', 'duotone-dark', 'duotone-darkcave', 'duotone-darkdesert', 'duotone-darkearth', 'duotone-darkforest', 'duotone-darkheath', 'duotone-darklake', 'duotone-darkmeadow', 'duotone-darkpark', 'duotone-darkpool', 'duotone-darksea', 'duotone-darkspace', 'dusk', 'dw_blue', 'dw_cyan', 'dw_green', 'dw_orange', 'dw_purple', 'dw_red', 'dw_yellow', 'dzo', 'earendel', 'earth', 'earthburn', 'eclipse', 'eclm_wombat', 'ecostation', 'editplus', 'edo_sea', 'ego', 'eink', 'ekinivim', 'ekvoli', 'elda', 'eldar', 'elflord', 'elise', 'elisex', 'elrodeo', 'elrond', 'emacs', 'enigma', 'enzyme', 'erez', 'eva', 'eva01-LCL', 'eva01', 'evening', 'evening1', 'evokai', 'evolution', 'fahrenheit', 'fairyfloss', 'falcon', 'far', 'felipec', 'feral', 'fight-in-the-shade', 'fine_blue', 'firewatch', 'flatcolor', 'flatland', 'flatlandia', 'flattened_dark', 'flattened_light', 'flattown', 'flattr', 'flatui', 'fnaqevan', 'fog', 'fokus', 'forneus', 'foursee', 'freya', 'frood', 'frozen', 'fruidle', 'fruit', 'fruity', 'fu', 'fx', 'garden', 'gardener', 'gemcolors', 'genericdc-light', 'genericdc', 'gentooish', 'getafe', 'getfresh', 'ghostbuster', 'github', 'gobo', 'golded', 'golden', 'goldenrod', 'goodwolf', 'google', 'gor', 'gotham', 'gotham256', 'gothic', 'grape', 'gravity', 'grayorange', 'graywh', 'grb256', 'greens', 'greenvision', 'greenwint', 'grey2', 'greyblue', 'greygull', 'grishin', 'gruvbox', 'gryffin', 'guardian', 'guepardo', 'h80', 'habiLight', 'happy_hacking', 'harlequin', 'heliotrope', 'hemisu', 'herald', 'heroku-terminal', 'heroku', 'herokudoc-gvim', 'herokudoc', 'hhazure', 'hhdblue', 'hhdcyan', 'hhdgray', 'hhdgreen', 'hhdmagenta', 'hhdred', 'hhdyellow', 'hhorange', 'hhpink', 'hhspring', 'hhteal', 'hhviolet', 'highlighter_term', 'highlighter_term_bright', 'highwayman', 'hilal', 'holokai', 'hornet', 'horseradish256', 'hotpot', 'hual', 'hybrid-light', 'hybrid', 'hybrid_material', 'hybrid_reverse', 'hydrangea', 'iangenzo', 'ibmedit', 'icansee', 'iceberg', 'immortals', 'impact', 'impactG', 'impactjs', 'industrial', 'industry', 'ingretu', 'inkpot', 'inori', 'ir_black', 'ironman', 'itg_flat', 'itg_flat_transparent', 'itsasoa', 'jaime', 'jammy', 'janah', 'japanesque', 'jelleybeans', 'jellybeans', 'jellygrass', 'jellyx', 'jhdark', 'jhlight', 'jiks', 'jitterbug', 'kalahari', 'kalisi', 'kalt', 'kaltex', 'kate', 'kellys', 'khaki', 'kib_darktango', 'kib_plastic', 'kings-away', 'kiss', 'kkruby', 'koehler', 'kolor', 'kruby', 'kyle', 'laederon', 'lakers_away', 'landscape', 'lanox', 'lanzarotta', 'lapis256', 'last256', 'late_evening', 'lazarus', 'legiblelight', 'leglight2', 'leo', 'less', 'lettuce', 'leya', 'lightcolors', 'lightning', 'lilac', 'lilydjwg_dark', 'lilydjwg_green', 'lilypink', 'lingodirector', 'liquidcarbon', 'literal_tango', 'lizard', 'lizard256', 'lodestone', 'loogica', 'louver', 'lucid', 'lucius', 'luinnar', 'lumberjack', 'luna-term', 'luna', 'lxvc', 'lyla', 'mac_classic', 'macvim-light', 'made_of_code', 'madeofcode', 'magellan', 'magicwb', 'mango', 'manuscript', 'manxome', 'marklar', 'maroloccio', 'maroloccio2', 'maroloccio3', 'mars', 'martin_krischik', 'material-theme', 'material', 'materialbox', 'materialtheme', 'matrix', 'maui', 'mayansmoke', 'mdark', 'mellow', 'messy', 'meta5', 'metacosm', 'midnight', 'miko', 'minimal', 'minimalist', 'mint', 'mizore', 'mod8', 'mod_tcsoft', 'mohammad', 'mojave', 'molokai', 'molokai_dark', 'monoacc', 'monochrome', 'monokai-chris', 'monokai-phoenix', 'monokain', 'montz', 'moody', 'moonshine', 'moonshine_lowcontrast', 'moonshine_minimal', 'mophiaDark', 'mophiaSmoke', 'mopkai', 'more', 'moria', 'moriarty', 'morning', 'moss', 'motus', 'mourning', 'mrkn256', 'mrpink', 'mud', 'muon', 'murphy', 'mushroom', 'mustang', 'mythos', 'native', 'nature', 'navajo-night', 'navajo', 'nazca', 'nedit', 'nedit2', 'nefertiti', 'neodark', 'neon', 'neonwave', 'nerv-ous', 'nes', 'nets-away', 'neuromancer', 'neutron', 'neverland-darker', 'neverland', 'neverland2-darker', 'neverland2', 'neverness', 'nevfn', 'new-railscasts', 'newspaper', 'newsprint', 'nicotine', 'night', 'nightVision', 'night_vision', 'nightflight', 'nightflight2', 'nightshade', 'nightshade_print', 'nightshimmer', 'nightsky', 'nightwish', 'no_quarter', 'noclown', 'nocturne', 'nofrils-acme', 'nofrils-dark', 'nofrils-light', 'nofrils-sepia', 'nord', 'nordisk', 'northland', 'northpole', 'northsky', 'norwaytoday', 'nour', 'nuvola', 'obsidian', 'obsidian2', 'oceanblack', 'oceanblack256', 'oceandeep', 'oceanlight', 'off', 'olive', 'onedark', 'orange', 'osx_like', 'otaku', 'oxeded', 'pablo', 'pacific', 'paintbox', 'paramount', 'parsec', 'peachpuff', 'peaksea', 'pencil', 'penultimate', 'peppers', 'perfect', 'petrel', 'pf_earth', 'phd', 'phoenix', 'phphaxor', 'phpx', 'pink', 'pixelmuerto', 'plasticine', 'playroom', 'pleasant', 'potts', 'predawn', 'preto', 'pride', 'primaries', 'primary', 'print_bw', 'prmths', 'professional', 'proton', 'ps_color', 'pspad', 'pt_black', 'putty', 'pw', 'py-darcula', 'pyte', 'python', 'quagmire', 'quantum', 'radicalgoodspeed', 'raggi', 'railscasts', 'rainbow_autumn', 'rainbow_fine_blue', 'rainbow_fruit', 'rainbow_night', 'rainbow_sea', 'rakr-light', 'random', 'rastafari', 'rcg_gui', 'rcg_term', 'rdark-terminal', 'rdark', 'redblack', 'redstring', 'refactor', 'relaxedgreen', 'reliable', 'reloaded', 'revolutions', 'robinhood', 'rockets-away', 'ron', 'rootwater', 'sadek1', 'sand', 'sandydune', 'satori', 'saturn', 'scheakur', 'scite', 'scooby', 'seagull', 'sean', 'seashell', 'seattle', 'selenitic', 'seoul', 'seoul256-light', 'seoul256', 'seti', 'settlemyer', 'sexy-railscasts', 'sf', 'shades-of-teal', 'shadesofamber', 'shine', 'shiny-white', 'shobogenzo', 'sialoquent', 'sienna', 'sierra', 'sift', 'silent', 'simple256', 'simple_b', 'simple_dark', 'simpleandfriendly', 'simplewhite', 'simplon', 'skittles_autumn', 'skittles_berry', 'skittles_dark', 'sky', 'slate2', 'smarties', 'smp', 'smpl', 'smyck', 'soda', 'softblue', 'softbluev2', 'softlight', 'sol-term', 'sol', 'solarized', 'solarized8_dark', 'solarized8_dark_flat', 'solarized8_dark_high', 'solarized8_dark_low', 'solarized8_light', 'solarized8_light_flat', 'solarized8_light_high', 'solarized8_light_low', 'sole', 'sonofobsidian', 'sonoma', 'sorcerer', 'soruby', 'soso', 'sourcerer', 'southernlights', 'southwest-fog', 'space-vim-dark', 'spacegray', 'spacemacs-theme', 'spartan', 'spectro', 'spiderhawk', 'spring-night', 'spring', 'sprinkles', 'spurs_away', 'srcery-drk', 'srcery', 'stackoverflow', 'stefan', 'stereokai', 'stingray', 'stonewashed-256', 'stonewashed-dark-256', 'stonewashed-dark-gui', 'stonewashed-gui', 'stormpetrel', 'strange', 'strawimodo', 'summerfruit', 'summerfruit256', 'sunburst', 'surveyor', 'swamplight', 'sweater', 'symfony', 'synic', 'synthwave', 'tabula', 'tango-desert', 'tango-morning', 'tango', 'tango2', 'tangoX', 'tangoshady', 'taqua', 'tatami', 'tayra', 'tchaba', 'tchaba2', 'tcsoft', 'telstar', 'tender', 'termschool', 'tesla', 'tetragrammaton', 'textmate16', 'thegoodluck', 'thermopylae', 'thestars', 'thor', 'thornbird', 'tibet', 'tidy', 'tigrana-256-dark', 'tigrana-256-light', 'tir_black', 'tolerable', 'tomatosoup', 'tony_light', 'toothpik', 'torte', 'transparent', 'triplejelly', 'trivial256', 'trogdor', 'tropikos', 'true-monochrome', 'turbo', 'turtles', 'tutticolori', 'twilight', 'twilight256', 'twitchy', 'two-firewatch', 'two2tango', 'ubaryd', 'ubloh', 'umber-green', 'understated', 'underwater-mod', 'underwater', 'unicon', 'up', 'valloric', 'vanzan_color', 'vc', 'vcbc', 'vertLaiton', 'vexorian', 'vibrantink', 'vice', 'vilight', 'vim-material', 'vimbrains', 'vimbrant', 'vimicks', 'visualstudio', 'vividchalk', 'vj', 'void', 'vorange', 'vydark', 'vylight', 'wargrey', 'warm_grey', 'warriors-away', 'wasabi256', 'watermark', 'wellsokai', 'welpe', 'white', 'whitebox', 'whitedust', 'widower', 'wikipedia', 'win9xblueback', 'winter', 'winterd', 'wintersday', 'woju', 'wolfpack', 'wombat', 'wombat256', 'wombat256dave', 'wombat256i', 'wombat256mod', 'wood', 'wuye', 'wwdc16', 'wwdc17', 'xcode-default', 'xcode', 'xedit', 'xemacs', 'xian', 'xmaslights', 'xoria256', 'xterm16', 'yeller', 'yuejiu', 'zazen', 'zellner', 'zen', 'zenburn', 'zenesque', 'zephyr', 'zmrok', 'znake']  " colorscheme names that we use to set color

" Set list of color scheme names that we will use, except
" argument 'now' actually changes the current color scheme.
function! s:SetColors(args)
  if len(a:args) == 0
    echo 'Current color scheme names:'
    let i = 0
    while i < len(s:mycolors)
      echo '  '.join(map(s:mycolors[i : i+4], 'printf("%-14s", v:val)'))
      let i += 5
    endwhile
  elseif a:args == 'all'
    let paths = split(globpath(&runtimepath, 'colors/*.vim'), "\n")
    let s:mycolors = uniq(sort(map(paths, 'fnamemodify(v:val, ":t:r")')))
    echo 'List of colors set from all installed color schemes'
  elseif a:args == 'my'
    let c1 = 'default elflord peachpuff desert256 breeze morning'
    let c2 = 'darkblue gothic aqua earth black_angus relaxedgreen'
    let c3 = 'darkblack freya motus impact less chocolateliquor'
    let s:mycolors = split(c1.' '.c2.' '.c3)
    echo 'List of colors set from built-in names'
  elseif a:args == 'now'
    call s:HourColor()
  else
    let s:mycolors = split(a:args)
    echo 'List of colors set from argument (space-separated names)'
  endif
endfunction

command! -nargs=* SetColors call s:SetColors('<args>')

" Set next/previous/random (how = 1/-1/0) color from our list of colors.
" The 'random' index is actually set from the current time in seconds.
" Global (no 's:') so can easily call from command line.
function! NextColor(how)
  call s:NextColor(a:how, 1)
endfunction

" Helper function for NextColor(), allows echoing of the color name to be
" disabled.
function! s:NextColor(how, echo_color)
  if len(s:mycolors) == 0
    call s:SetColors('all')
  endif
  if exists('g:colors_name')
    let current = index(s:mycolors, g:colors_name)
  else
    let current = -1
  endif
  let missing = []
  let how = a:how
  for i in range(len(s:mycolors))
    if how == 0
      let current = localtime() % len(s:mycolors)
      let how = 1  " in case random color does not exist
    else
      let current += how
      if !(0 <= current && current < len(s:mycolors))
        let current = (how>0 ? 0 : len(s:mycolors)-1)
      endif
    endif
    try
      execute 'colorscheme '.s:mycolors[current]
      break
    catch /E185:/
      call add(missing, s:mycolors[current])
    endtry
  endfor
  redraw
  if len(missing) > 0
    echo 'Error: colorscheme not found:' join(missing)
  endif
  if (a:echo_color)
    echo g:colors_name
  endif
endfunction

nnoremap <F8> :call NextColor(1)<CR>
nnoremap <S-F8> :call NextColor(-1)<CR>
nnoremap <A-F8> :call NextColor(0)<CR>

" Set color scheme according to current time of day.
function! s:HourColor()
  let hr = str2nr(strftime('%H'))
  if hr <= 3
    let i = 0
  elseif hr <= 7
    let i = 1
  elseif hr <= 14
    let i = 2
  elseif hr <= 18
    let i = 3
  else
    let i = 4
  endif
  let nowcolors = 'elflord morning desert evening pablo'
  execute 'colorscheme '.split(nowcolors)[i]
  redraw
  echo g:colors_name
endfunction

