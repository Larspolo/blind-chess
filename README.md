# django-chess


## Release Note

### 0.0.1
[ui] basic stuff
* grid
* pieces

### 0.0.2
[game logic]
* implementation of all pieces standard moves
* added special moves : Pawn+2, Enpassant, Promotion

[ui]
* colors on selected/moved pieces
* logs
* turn side information
* debug details

### 0.0.3
[game logic]
* avoid move when inducing check on own king
* added checkmate/surrender button (required to finish a game when checkmate)
* added complete rook move

[ui]
* lifter in logs panel
* own king check information


## Incoming

### feature_user_management
[game logic]
* authentication form and views filtering
* user participation management
* winning_games management

[ui]
* lobby : opened, running and closed games, game creation
* filter menu buttons depending on user profile :
 * viewer : nothing
 * player : surrender/checkmate
 * game creator : Reset current round, Reset game
* refresh page for waiting player and viewers


## Todo

### Urgent
[game logic]
* give user capacity to :
  1. edit/delete its own games
  1. start the game when all sides have a player

[ui]
* information for all avoid move cases


### MidTerm
[game logic]
* for viewers : add capacity to move in history and log
* for players : add capacity to move in log
 * add 'rewrite log' option to enable move-in-log (and find a better label)
 * forbidden for ranked games

### LongTerm
[game logic]
* refactor lobby mechanics to a Lobby class :
 * game management : generic status to retrieve opened/running/finished/archived specific status
 * game creation : generic form to manage game specific creation process)
 * user management : generic user participation (1v1, NvN, etc)
* user ranking :
 * Elo calculation
 * player Elo initialization
 * find ranked game (based on Elo)
 * find unranked game (based on Elo, or not)

[ui]
* bootstrap
* nice colors (button)
* Elo statistic pages

## Refactoring

### Shield :
* x,y/c,l coordinates

### Layerize :
* think about a kind of BoardDataAccessor to facilite/centralize access to board data :
    - standard format to pass request parameters (by-coords/by-piece, etc)

* think about a real game_data object to improve access to sql data :
    - get : return cache data, otherwise sql data (and store in cache)
    - set : stores data in sql and cache







## PersistentData Game Model :

```python
{
   'token': {
      'step': {
         'side': '[white/black]'
         'name': '[waitReadyToStart/waitCellSource/waitCellTarget/pieceMoved/checkmate]'
         'data': {
            'targetCell": {
               'column': 'f',
               'line": '4'
            },
            'sourceCell': {
               'column': 'f',
               'line': '2'
            },
            ['eaten': {
					's': 'w',
					'r': 'P',
					'n': 'p6'
			}]
         }
         ['enpassant': {
            'y': 3,
            'x': 5
         }]
      },
      'logs': {
         '001.': {
            'official': 'e2-e4',
            'side': 'w',
            'source': {
               'x': 'e',
               'y': '2',
               'piece': {
                  's': 'w',
                  'r': 'P',
                  'n': 'P5'
               }
            },
            'target': {
               'x': 'e',
               'y': '4',
               'piece': '-'
            }
         },
         [...]
      }
   },
   'board': {
      '1': {
         'a': {
            's': 'w',
            'r': 'R',
            'n': 'r2'
         },
         [...]
       },
      [...]
   },
   'logs': {
      'nnn': {
         'side': 'white/black',
         'official': 'xxx/e2-e4',
         'source': {
            'piece': 'p',
            'x': 'e',
            'y': '2'
         },
         'target': {
            'x': 'e',
            'y': '4'
         }
      }
   },
   'game_options': {
      'name': 'xxx',
      'winning_games': 1/2/n,
      'creator': user_id,
      'ranked': true/false
      'public': true/false
   },
   'participants': {
        'white': {
            '1': user_id,
        },
        'black': {
            '1': user_id,
            '2': user_id,
        }
   },
   'rounds': {
        '1': {
            'result': 'checkmate/draw/withdraw',
            'winner': 'white/black'
        }
   }
}
```




## Limitations
* no check/checkmate arbitration (checkmate must be manually played to be applied)

## known bugs
### GRAVE (not contournable)
* rook error (seems no more initialized since user management)

### MAJOR (contournable manually)

### MINOR
* promotion available when checkmate                    todo : a verifier


## fast ideas


### token change automations
* king checking :
   - checkmate should be automatically detected

### gamelogic
* ending of game (withdraw, draw)

