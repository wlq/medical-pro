package sy.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import sy.dao.BaseDaoI;
import sy.model.Tkemu;
import sy.pageModel.DataGrid;
import sy.pageModel.Kemu;
import sy.service.KemuServiceI;

@Service("kemuService")
public class KemuServiceImpl extends BaseServiceImpl implements KemuServiceI {

	private BaseDaoI<Tkemu> kemuDao;

	public BaseDaoI<Tkemu> getKemuDao() {
		return kemuDao;
	}

	@Autowired
	public void setkemuDao(BaseDaoI<Tkemu> kemuDao) {
		this.kemuDao = kemuDao;
	}

	@Transactional(propagation = Propagation.SUPPORTS)
	public DataGrid datagrid(Kemu kemu) {
		DataGrid j = new DataGrid();
		j.setRows(getKemusFromTkemus(find(kemu)));
		j.setTotal(total(kemu));
		return j;
	}
	private List<Kemu> getKemusFromTkemus(List<Tkemu> tkemus) {
		List<Kemu> kemus = new ArrayList<Kemu>();
		if (tkemus != null && tkemus.size() > 0) {
			for (Tkemu tb : tkemus) {
				Kemu b = new Kemu();
				BeanUtils.copyProperties(tb, b);
				kemus.add(b);
			}
		}
		return kemus;
	}

	private List<Tkemu> find(Kemu kemu) {
		String hql = "select new Tkemu(	t.cid,t.cname,t.ccountId,t.ccountTime,t.ccourse,t.cmoney,t.ctickets,t.cdatei) from Tkemu t where 1=1 ";

		List<Object> values = new ArrayList<Object>();
		hql = addWhere(kemu, hql, values);

		if (kemu.getSort() != null && kemu.getOrder() != null) {
			hql += " order by " + kemu.getSort() + " " + kemu.getOrder();
		}
		return kemuDao.find(hql, values, kemu.getPage(), kemu.getRows());
	}

	private Long total(Kemu kemu) {
		String hql = "select count(*) from Tkemu t where 1=1 ";
		List<Object> values = new ArrayList<Object>();
		hql = addWhere(kemu, hql, values);
		return kemuDao.count(hql, values);
	}

	private String addWhere(Kemu kemu, String hql, List<Object> values) {
		return hql;
	}

	public void add(Kemu kemu) {
		if (kemu.getCid() == null || kemu.getCid().trim().equals("")) {
			kemu.setCid(UUID.randomUUID().toString());
		}
		Tkemu t = new Tkemu();
		BeanUtils.copyProperties(kemu, t);
		kemuDao.save(t);
	}

	public void update(Kemu kemu) {
		Tkemu t = kemuDao.get(Tkemu.class, kemu.getCid());
		if (t != null) {			
			BeanUtils.copyProperties(kemu, t, new String[] { "cid" });
		}
	}

	public void delete(String ids) {
		if (ids != null) {
			for (String id : ids.split(",")) {
				Tkemu t = kemuDao.get(Tkemu.class, id);
				if (t != null) {
					kemuDao.delete(t);
				}
			}
		}
	}

	public Tkemu get(Kemu kemu) {
		Tkemu menu = kemuDao.get(Tkemu.class, kemu.getCid());
		return menu;
	}

}
