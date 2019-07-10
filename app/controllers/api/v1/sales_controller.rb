class Api::V1::SalesController < ApplicationController
    before_action :authenticate_api_v1_admin!, except: :sale_html
    before_action :set_sale, only: [:update, :destroy, :show]

    def create
        @sale = Sale.new sale_params
        if @sale.save!
            @sale.create_sale_product(params)
        else
            render json: @sale.errors, status: :unprocessable_entity
        end
    end

    def index
        params[:page] ||= 1
        @sales = Sale.joins(:user).where("users.name ilike '%#{params[:field]}%'").page(params[:page]).per(10)
    end

    def update
        if !@sale.update!(sale_params) 
            render json: @sale.errors, status: :unprocessable_entity
        else
            @sale.create_sale_product(params)
        end
    end
    
    def destroy
        @sale.sale_products.destroy_all
        @sale.delete
    end

    def sale_html
        @sale = Sale.last
        table = ""
        @sale.sale_products.each do |sale_product|
            table = table + "<tr><td>#{sale_product.amount}</td><td>#{sale_product.product.name}</td><td>#{sale_product.product.value_smash}</td><td>#{sale_product.product.value}</td></tr>"
        end
        # html = "<!DOCTYPE html><html><head><title>Ame</title><style media='screen'>.title{text-align: center}</style></head><body><div class='title'><h2>MASTER FESTAS 2019</h2><h4>RUA POUSO ALEGRE 3486</h4></div><div><strong>Nome:</strong></strong> #{@sale.user.name}</div><div><strong>Endereço:</strong> #{@sale.user.address}<strong>Numero:</strong> #{@sale.user.number}<strong>APT:</strong> #{@sale.user.complement}</div><div><strong>Bairro:</strong> Saudade<strong>Email:</strong> #{@sale.user.name}</div><div><strong>Telefone Residencial: #{@sale.user.cell_phone}</strong> <strong>Celular:</strong> #{@sale.user.telephone}</div><div><strong>Endereço do evento:</strong> #{@sale.address}</div><div><strong>Nome do Aniversariante:</strong> #{@sale.birthday_name}<strong>Idade:</strong> #{@sale.year} anos</div><div><strong>Quantidade de Crianças:</strong> #{@sale.number_children} crianças <strong>Faixa Etaria:</strong> #{@sale.age_range} anos</div><div><strong>Quantidade de Adultos:</strong> #{@sale.amount_adult} adultos <strong>Horario:</strong> #{@sale.hour}</div><div><strong>Data do Evento:</strong> #{@sale.date_event} <strong>Dia da Semana:</strong> #{@sale.day_week}</div><div><table><tr><th>Quantidade</th><th>Serviços contratados</th><th>Valor de Quebra</th><th>Valores</th> </tr>#{table}</table></div></body></html>"
        html = "<!DOCTYPE html><html><head><meta http-equiv='Content-Type' content='text/html; charset=utf-8'><link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css' integrity='sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u' crossorigin='anonymous'><link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css' integrity='sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp' crossorigin='anonymous'><script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js' integrity='sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa' crossorigin='anonymous'></script><title>Ame</title><style media='screen'>.title{text-align: center}.container{font-size: 17px}.div-title{margin: 10px}strong{font-size: 18px}th{font-size: 18px}</style></head><body><div class='title'><h2>MASTER FESTAS 2019</h2><h4>RUA POUSO ALEGRE 3486</h4></div><div class='container row'><div class='div-title row'><div class='col-sm-6 col-md-6 col-lg-6'><strong>Nome:</strong> #{@sale.user.name}&nbsp;&nbsp;&nbsp;</div></div><div class='div-title row'><div class='col-sm-4 col-md-4 col-lg-4'><strong>Endereço:</strong> #{@sale.user.address}&nbsp;&nbsp;&nbsp;</div><div class='col-sm-4 col-md-4 col-lg-4'><strong>Numero:</strong> #{@sale.user.number}&nbsp;&nbsp;&nbsp;</div><div class='col-sm-4 col-md-4 col-lg-4'><strong>APT:</strong> #{@sale.user.complement}&nbsp;&nbsp;&nbsp;</div></div><div class='div-title row'><div class='col-sm-6 col-md-6 col-lg-6'><strong>Bairro:</strong> Saudade&nbsp;&nbsp;&nbsp;</div><div class='col-sm-6 col-md-6 col-lg-6'><strong>Email:</strong> #{@sale.user.name}&nbsp;&nbsp;&nbsp;</div></div><div class='div-title row'><div class='col-sm-6 col-md-6 col-lg-6'><strong>Telefone Residencial:</strong>#{@sale.user.cell_phone}&nbsp;&nbsp;&nbsp;</div><div class='col-sm-6 col-md-6 col-lg-6'><strong>Celular:</strong> #{@sale.user.telephone}&nbsp;&nbsp;&nbsp;</div></div><div class='div-title row'><div class='col-sm-6 col-md-6 col-lg-6'><strong>Endereço do evento:</strong> #{@sale.address}&nbsp;&nbsp;&nbsp;</div></div><div class='div-title row'><div class='col-sm-6 col-md-6 col-lg-6'><strong>Nome do Aniversariante:</strong> #{@sale.birthday_name}&nbsp;&nbsp;&nbsp;</div><div class='col-sm-6 col-md-6 col-lg-6'><strong>Idade:</strong> #{@sale.year} anos&nbsp;&nbsp;&nbsp;</div></div><div class='div-title row'><div class='col-sm-6 col-md-6 col-lg-6'><strong>Quantidade de Crianças:</strong> #{@sale.number_children} crianças &nbsp;&nbsp;&nbsp;</div><div class='col-sm-6 col-md-6 col-lg-6'><strong>Faixa Etaria:</strong> #{@sale.age_range} anos&nbsp;&nbsp;&nbsp;</div></div><div class='div-title row'><div class='col-sm-6 col-md-6 col-lg-6'><strong>Quantidade de Adultos:</strong> #{@sale.amount_adult} adultos &nbsp;&nbsp;&nbsp;</div><div class='col-sm-6 col-md-6 col-lg-6'><strong>Horario:</strong> #{@sale.hour}&nbsp;&nbsp;&nbsp;</div></div><div class='div-title row'><div class='col-sm-6 col-md-6 col-lg-6'><strong>Data do Evento:</strong> #{@sale.date_event} &nbsp;&nbsp;&nbsp;</div><div class='col-sm-6 col-md-6 col-lg-6'><strong>Dia da Semana:</strong> #{@sale.day_week}&nbsp;&nbsp;&nbsp;</div></div><div class='div-title row'><table><tr><th class='div-title'><strong>Quantidade</strong></th><th class='div-title'><strong>Serviços contratados</strong></th><th class='div-title'><strong>Valor de Quebra</strong></th><th class='div-title'><strong>Valores</strong></th> </tr>#{table}</table></div></div></body></html>"
        # render :html => html.html_safe
        # format.html { render :file_name }
        kit = PDFKit.new(html, page_size: 'A4')
        send_data(kit.to_pdf, filename: "teste.pdf", :type => 'application/pdf')
    end

    private

    def sale_params
        params.permit(:id, :user_id, :address, :number, :apt, :complement, :reference, :phone, :cell_phone, :birthday_name, :year, :number_children, :age_range, :amount_adult, :hour, :date_event, :day_week, :date_final, :freight, :days_collect, :value_final)
    end

    def set_sale
        @sale = Sale.find(params[:id])
    end   

end
