SELECT t.cnpj, razao_social, nome_fantasia, capital_social, cnae_fiscal, tc.descricao AS cnae_fiscal_, 
tnat.descricao AS natureza_juridica, tipo_logradouro, logradouro, numero, complemento, bairro, cep, ddd1, telefone1, ddd2, telefone2, ddd_fax, fax, correio_eletronico, uf, tmun.descricao AS municipio_, nome_socio, 
nome_representante
FROM estabelecimento t
LEFT JOIN empresas te ON te.cnpj_basico=t.cnpj_basico
LEFT JOIN natureza_juridica tnat ON tnat.codigo=te.natureza_juridica
LEFT JOIN motivo tmot ON tmot.codigo=t.motivo_situacao_cadastral
LEFT JOIN municipio tmun ON tmun.codigo=t.municipio
LEFT JOIN cnae tc ON tc.codigo=t.cnae_fiscal
LEFT JOIN pais tpa ON tpa.codigo=t.pais
LEFT JOIN qualificacao_socio tq ON tq.codigo=te.qualificacao_responsavel
LEFT JOIN socios AS f ON t.cnpj=f.cnpj
WHERE cnae_fiscal LIKE "5620104" 
AND situacao_cadastral = "02"
AND UF="SP" 
AND municipio_ = "SAO PAULO"