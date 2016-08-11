require 'open-uri'
class YulBuilder < Spotlight::SolrDocumentBuilder
  def to_solr
    #http://localhost:8983/solr/spotlight_yale_demo/select?indent=on&q=*:*&wt=json
    solr_query = resource.url + "/select?indent=on&q=" + resource.query + "&wt=json&rows="+resource.rows.to_s
    content = JSON.parse(open(solr_query).read)
    #byebug
    content['response']['docs'].map do |doc|
      {
          'id': doc['id'],
          'full_title_tsim': doc['title_tsim'],
          'creator_tsim': doc['creator_tsim'],
          'subject_tsim': Array(doc['subject_name_tsim']).map{|x| x['name']}
      }
    end
  end
end