# -*-perl-*-
# vim: set filetype=perl:
######################################################################

use strict;

########################################################################
# Control of Page layout:
# There are the following subs which control the layout:

$print_navigation	      = \&pgdoc_T2H_DEFAULT_print_navigation;

######################################################################
# navigation panel
#

sub pgdoc_T2H_DEFAULT_print_navigation
{
    my $buttons = shift;
    my $vertical = shift;

    my $result = '';
    $result .= '<div class="header">'."\n";
    $result .= '<table cellpadding="1" cellspacing="1" border="0">'."\n";
    $result .= "<tr>" unless $vertical;
    for my $button (@$buttons)
    {
        $result .= qq{<tr valign="top" align="left">\n} if $vertical;
        $result .=  qq{<td valign="middle" align="left">};

        if (ref($button) eq 'CODE')
        {
            $result .= &$button($vertical);
        }
        elsif (ref($button) eq 'SCALAR')
        {
            $result .= "$$button" if defined($$button);
        }
        elsif (ref($button) eq 'ARRAY')
        {
            my $text = $button->[1];
            my $button_href = $button->[0];
            # verify that $button_href is simple text and text is a reference
            if (defined($button_href) and !ref($button_href) 
               and defined($text) and (ref($text) eq 'SCALAR') and defined($$text))
            {             # use given text
                if ($Texi2HTML::HREF{$button_href})
                {
                  my $anchor_attributes = '';
                  if ($USE_ACCESSKEY and (defined($BUTTONS_ACCESSKEY{$button_href})) and ($BUTTONS_ACCESSKEY{$button_href} ne ''))
                  {
                      $anchor_attributes = "accesskey=\"$BUTTONS_ACCESSKEY{$button_href}\"";
                  }
                  if ($USE_REL_REV and (defined($BUTTONS_REL{$button_href})) and ($BUTTONS_REL{$button_href} ne ''))
                  {
                      $anchor_attributes .= " rel=\"$BUTTONS_REL{$button_href}\"";
                  }
                  $result .=  "" .
                        &$anchor('',
                                    $Texi2HTML::HREF{$button_href},
                                    $$text,
                                    $anchor_attributes
                                   ) 
                                    ;
                }
                else
                {
                  $result .=  $$text;
                }
            }
        }
        elsif ($button eq ' ')
        {                       # handle space button
            $result .= 
                ($ICONS && $ACTIVE_ICONS{' '}) ?
                    &$button_icon_img($BUTTONS_NAME{$button}, $ACTIVE_ICONS{' '}) :
                        $NAVIGATION_TEXT{' '};
            #next;
        }
        elsif ($Texi2HTML::HREF{$button})
        {                       # button is active
            my $btitle = $BUTTONS_GOTO{$button} ?
                'title="' . $BUTTONS_GOTO{$button} . '"' : '';
            if ($USE_ACCESSKEY and (defined($BUTTONS_ACCESSKEY{$button})) and ($BUTTONS_ACCESSKEY{$button} ne ''))
            {
                $btitle .= " accesskey=\"$BUTTONS_ACCESSKEY{$button}\"";
            }
            if ($USE_REL_REV and (defined($BUTTONS_REL{$button})) and ($BUTTONS_REL{$button} ne ''))
            {
                $btitle .= " rel=\"$BUTTONS_REL{$button}\"";
            }
            if ($ICONS && $ACTIVE_ICONS{$button})
            {                   # use icon
                $result .= '' .
                    &$anchor('',
                        $Texi2HTML::HREF{$button},
                        &$button_icon_img($BUTTONS_NAME{$button},
                                   $ACTIVE_ICONS{$button},
                                   $Texi2HTML::SIMPLE_TEXT{$button}),
                        $btitle
                      );
            }
            else
            {                   # use text
                $result .= 
                    '[' .
                        &$anchor('',
                                    $Texi2HTML::HREF{$button},
                                    $NAVIGATION_TEXT{$button},
                                    $btitle
                                   ) .
                                       ']';
            }
        }
        else
        {                       # button is passive
            $result .= 
                $ICONS && $PASSIVE_ICONS{$button} ?
                    &$button_icon_img($BUTTONS_NAME{$button},
                                          $PASSIVE_ICONS{$button},
                                          $Texi2HTML::SIMPLE_TEXT{$button}) :

                                              "[" . $NAVIGATION_TEXT{$button} . "]";
        }
        $result .= "</td>\n";
        $result .= "</tr>\n" if $vertical;
    }
    $result .= "</tr>" unless $vertical;
    $result .= "</table>\n";
    $result .= "</div>\n";
    return $result;
}

1;
