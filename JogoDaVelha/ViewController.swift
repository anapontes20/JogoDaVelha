//
//  ViewController.swift
//  JogoDaVelha
//
//  Created by Ana Pontes on 20/04/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    enum Turno {
        case xis
        case bola
        
    }
    
    @IBOutlet weak var TurnoLabel: UILabel!
    @IBOutlet weak var C3: UIButton!
    @IBOutlet weak var C2: UIButton!
    @IBOutlet weak var C1: UIButton!
    @IBOutlet weak var B3: UIButton!
    @IBOutlet weak var A3: UIButton!
    @IBOutlet weak var A1: UIButton!
    @IBOutlet weak var B2: UIButton!
    @IBOutlet weak var B1: UIButton!
    @IBOutlet weak var A2: UIButton!
    @IBOutlet weak var placarX: UILabel!
    @IBOutlet weak var placarBola: UILabel!
    
    
    var PrimeiraJogada = Turno.bola
    var JogadaAtual = Turno.xis
    
    var BOLA = "O"
    var XIS = "X"
    var borda = [UIButton]()
    var valorPlacarX = 0
    var valorPlacarBola = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initBorda()
    }
    
    func initBorda() {
        borda.append(A1)
        borda.append(A2)
        borda.append(A3)
        borda.append(B1)
        borda.append(B2)
        borda.append(B3)
        borda.append(C1)
        borda.append(C2)
        borda.append(C3)
    }
    
    
    @IBAction func CasaClicada(_ sender: UIButton) {
        itemAdicionado(sender)
        
        funcaoVitoria()
        
        if(fullBorda()) {
            resultAlert(title: "Parece que tivemos um empate!")
        }

   
    }
    
    
    func resultAlert(title:String) {
        let ac = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Tentar novamente", style: .default, handler: { (_) in self.resetBorda()
            
        }))
        self.present(ac,animated: true)
    }
    
    func resetBorda() {
        for button in borda {
            button.setTitle(nil, for: .normal)
            button.isEnabled = true
        }
        if (PrimeiraJogada == Turno.bola) {
            PrimeiraJogada = Turno.xis
            TurnoLabel.text = XIS
        }
        else if (PrimeiraJogada == Turno.xis) {
            PrimeiraJogada = Turno.bola
            TurnoLabel.text = BOLA
        }
        JogadaAtual = PrimeiraJogada
        JogadaAtual == Turno.xis ? (PrimeiraJogada = Turno.bola) : (PrimeiraJogada = Turno.xis)
        
    }
    
    func fullBorda() -> Bool {
        for button in borda {
            if button.title(for: .normal) == nil {
                return false
            }
        }
        return true
    }
    
    func itemAdicionado(_ sender: UIButton) {
        
        if sender.title(for: .normal) == nil {
            
            if(JogadaAtual == PrimeiraJogada) {
                sender.setTitle(BOLA, for: .normal)
                JogadaAtual = Turno.xis
                TurnoLabel.text = XIS
            }
            else if(JogadaAtual == Turno.xis) {
                
                sender.setTitle(XIS, for: .normal)
                JogadaAtual = Turno.bola
                TurnoLabel.text = BOLA
            }
            sender.isEnabled = false                                                     
        }
    }
    
    
    // funcao da vitoria
    func vitoriaAlert(title:String) {
        
        let ac = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Tentar novamente", style: .default, handler: { (_) in self.resetBorda()
            
        }))
        self.present(ac,animated: true)
    }
    
    // FUNCAO PARA O PLACAR
    func atualizarPlacar(ganhador : String) {
        if ganhador == BOLA{
            valorPlacarBola += 1
            placarBola.text = "\(valorPlacarBola)"
            if valorPlacarBola >= 5 {
                // Zera o placar
                valorPlacarX = 0
                valorPlacarBola = 0
                placarX.text = "0"
                placarBola.text = "0"
            }

        } else if ganhador == XIS{
            valorPlacarX += 1
            placarX.text = "\(valorPlacarX)"
            if valorPlacarX >= 5 {
                // Zera o placar
                valorPlacarX = 0
                valorPlacarBola = 0
                placarX.text = "0"
                placarBola.text = "0"
            }

        }
    }
    
    
    func funcaoVitoria() {
        
        // funcoes para vitoria de XIS
        if A1.title(for: .normal) == XIS && A2.title(for: .normal) == XIS && A3.title(for: .normal) == XIS {
            vitoriaAlert(title: "X ganhou")
            atualizarPlacar(ganhador: XIS)
        } else if B1.title(for: .normal) == XIS && B2.title(for: .normal) == XIS && B3.title(for: .normal) == XIS {
            vitoriaAlert(title: "X ganhou")
            atualizarPlacar(ganhador: XIS)
        } else if C1.title(for: .normal) == XIS && C2.title(for: .normal) == XIS && C3.title(for: .normal) == XIS {
            vitoriaAlert(title: "X ganhou")
            atualizarPlacar(ganhador: XIS)
        } else if A1.title(for: .normal) == XIS && B1.title(for: .normal) == XIS && C1.title(for: .normal) == XIS {
            vitoriaAlert(title: "X ganhou")
            atualizarPlacar(ganhador: XIS)
        } else if A2.title(for: .normal) == XIS && B2.title(for: .normal) == XIS && C2.title(for: .normal) == XIS {
            vitoriaAlert(title: "X ganhou")
            atualizarPlacar(ganhador: XIS)
        } else if A3.title(for: .normal) == XIS && B3.title(for: .normal) == XIS && C3.title(for: .normal) == XIS {
            vitoriaAlert(title: "X ganhou")
            atualizarPlacar(ganhador: XIS)
        } else if A1.title(for: .normal) == XIS && B2.title(for: .normal) == XIS && C3.title(for: .normal) == XIS {
            vitoriaAlert(title: "X ganhou")
            atualizarPlacar(ganhador: XIS)
        } else if A3.title(for: .normal) == XIS && B2.title(for: .normal) == XIS && C1.title(for: .normal) == XIS {
            vitoriaAlert(title: "X ganhou")
            atualizarPlacar(ganhador: XIS)
        }
        // funcoes para vitoria de BOLA
        if A1.title(for: .normal) == BOLA && A2.title(for: .normal) == BOLA && A3.title(for: .normal) == BOLA {
            vitoriaAlert(title: "Bola ganhou")
            atualizarPlacar(ganhador: BOLA)
        } else if B1.title(for: .normal) == BOLA && B2.title(for: .normal) == BOLA && B3.title(for: .normal) == BOLA {
            vitoriaAlert(title: "Bola ganhou")
            atualizarPlacar(ganhador: BOLA)
        } else if C1.title(for: .normal) == BOLA && C2.title(for: .normal) == BOLA && C3.title(for: .normal) == BOLA {
            vitoriaAlert(title: "Bola ganhou")
            atualizarPlacar(ganhador: BOLA)
        } else if A1.title(for: .normal) == BOLA && B1.title(for: .normal) == BOLA && C1.title(for: .normal) == BOLA {
            vitoriaAlert(title: "Bola ganhou")
            atualizarPlacar(ganhador: BOLA)
        } else if A2.title(for: .normal) == BOLA && B2.title(for: .normal) == BOLA && C2.title(for: .normal) == BOLA {
            vitoriaAlert(title: "Bola ganhou")
            atualizarPlacar(ganhador: BOLA)
        } else if A3.title(for: .normal) == BOLA && B3.title(for: .normal) == BOLA && C3.title(for: .normal) == BOLA {
            vitoriaAlert(title: "Bola ganhou")
            atualizarPlacar(ganhador: BOLA)
        } else if A1.title(for: .normal) == BOLA && B2.title(for: .normal) == BOLA && C3.title(for: .normal) == BOLA {
            vitoriaAlert(title: "Bola ganhou")
            atualizarPlacar(ganhador: BOLA)
        } else if A3.title(for: .normal) == BOLA && B2.title(for: .normal) == BOLA && C1.title(for: .normal) == BOLA {
            vitoriaAlert(title: "Bola ganhou")
            atualizarPlacar(ganhador: BOLA)
        }
     
        // funcao para empate
         //else
        
    
        
        
        
        
        
    }
    
}
